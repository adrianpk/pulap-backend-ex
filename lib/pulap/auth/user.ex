defmodule Pulap.Auth.User do
  import Comeonin.Bcrypt #, only: [checkpw: 2, dummy_checkpw: 0]

  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Auth
  alias Pulap.Auth.User

  require Logger
  require IEx

  schema "users" do
    field :annotations, :string
    field :card, :string
    field :created_by_id, Ecto.UUID
    field :email, :string
    field :family_name, :string
    field :geolocation, Geo.Point
    field :given_name, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :middle_names, :string
    field :given_password, :string, virtual: true
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :started_at, :utc_datetime
    field :updated_by_id, Ecto.UUID
    field :username, :string

    timestamps()

    # Roles
    has_many :user_roles, Pulap.Auth.UserRole,
      on_delete: :nothing
    many_to_many :roles, Pulap.Auth.Role,
      join_through: Pulap.Auth.UserRole,
      on_delete: :nothing
    # # Profile
    # has_one :profile, Pulap.Auth.Profile,
    #   on_replace: :update,
    #   on_delete: :delete_all
    # # Organizations
    # has_many :organizations, Pulap.Auth.Organization,
    #   on_delete: :delete_all
    # # Tenures
    # has_many :tenures, Pulap.Biz.Tenure,
    #   on_delete: :delete_all
    # many_to_many :employers, Pulap.Auth.Organization,
    #   join_through: Pulap.Auth.Tenure,
    #   on_delete: :delete_all
    # # Real estates
    many_to_many :managed_real_estates, Pulap.Biz.RealEstate,
      join_through: Pulap.Biz.Managership,
      on_delete: :nothing
    has_many :ownerships, Pulap.Biz.Ownership,
      on_delete: :delete_all
    many_to_many :owned_real_estate, Pulap.Biz.RealEstate,
      join_through: Pulap.Biz.Ownership,
      on_delete: :nothing
  end

  # @doc false
  # def changeset(%User{} = user, attrs) do
  #   user
  #   |> cast(attrs, [:username, :password, :password_hash, :email, :given_name, :middle_names, :family_name, :card, :annotations, :geolocation, :started_at, :created_by_id, :updated_by_id :is_active, :is_logical_deleted])
  #   |> validate_required([:username, :password, :password_hash, :email, :given_name, :middle_names, :family_name, :card, :annotations, :geolocation, :started_at, :created_by_id, :updated_by_id, :is_active, :is_logical_deleted])
  # end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :email, :given_name, :middle_names, :family_name])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_email(user)
    |> add_password_digest()
  end

  @doc false
  def signup_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :email, :given_name, :middle_names, :family_name])
    |> validate_required([:username, :password, :email])
    |> validate_length(:username, min: 4, max: 16)
    |> validate_length(:password, min: 8, max: 32)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_email(user)
    |> add_password_digest()
  end

  @doc false
  def update_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :password_confirmation,
                   :given_password, :email, :given_name, :middle_names,
                   :family_name])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_required([:given_password])
    |> validate_password_change(user)
    |> validate_email(user)
    |> add_password_digest()
  end

  def validate_email(changeset, user) do
    case changeset do
      %Ecto.Changeset{changes: %{email: email}} when is_binary(email) ->
        case Regex.run(~r/^[A-Za-z0-9_%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, email) do
          nil ->
            changeset |> add_error(:email, "invalid email")
          [email] ->
            try do
              Regex.run(~r/(\w+)@([\w.]+)/, email) |> validate_domain_and_unique(changeset)
              changeset
            rescue RuntimeError ->
                changeset |> add_error(:email, "invalid email")
            end
          end
      _ ->
        case user.email do
          "" ->
            changeset |> add_error(:email, "invalid email")
          nil ->
            changeset |> add_error(:email, "invalid email")
          _ ->
            changeset
        end
      end
  end

  def validate_domain_and_unique([email, _username, host], changeset) do
    # FIX: Commented only for development
    # accepted_domains = Config.accepted_domains
    accepted_domains = ~w(localhost.com gmail.com hotmail.com localhost)
    case host in accepted_domains do
      true ->
        case find_by_email(email) do
          nil ->
            changeset
          _account ->
            changeset |> add_error(:email, "email is already registered")
        end
      _ ->
        changeset |> add_error(:email, "email not accepted")
    end
  end

  def find_by_email(email) do
    Pulap.Auth.get_user_by_email(email)
  end

  defp add_password_digest(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
        #put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpass(pass, salt))
      _ ->
        changeset
    end
  end


  defp validate_password_change(changeset, user) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: _password, password_confirmation: _password_confirmation, given_password: _given_password}} ->
        changeset
        |> verify_user(user)
        |> verify_current_password(user)
        |> verify_password_confirmation
        |> validate_length(:password, min: 8, max: 32)

      _ ->
        changeset
    end
  end

  defp verify_user(changeset, user) do
    user = Auth.get_user!(user.id)
    cond do
      user ->
        changeset

      true ->
        changeset
        |> add_error(:username, "invalid user")
    end
  end

  defp verify_current_password(changeset, user) do
    cond do
     checkpw(changeset.changes.given_password, user.password_hash) ->
        changeset

      true ->
        changeset
        |> add_error(:given_password, "does not much with current password")
    end
  end

  defp verify_password_confirmation(changeset) do
    cond do
      changeset.changes.password == changeset.changes.password_confirmation ->
        changeset

      true ->
        changeset
        |> add_error(:password_confirmation, "does not match with password")
    end
  end
end
