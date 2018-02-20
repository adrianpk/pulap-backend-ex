defmodule Pulap.Auth.UserRole do
  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Auth
  alias Pulap.Repo
  alias Pulap.Auth.UserRole
  alias Pulap.Auth.Organization
  alias Pulap.Auth.User
  alias Pulap.Auth.Role


  schema "user_roles" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    # field :organization_id, Ecto.UUID
    field :user_id, Ecto.UUID
    field :role_id, Ecto.UUID
    field :created_by_id, Ecto.UUID
    field :updated_by_id, Ecto.UUID

    timestamps()
 
    # Organization
    belongs_to :organization, Pulap.Auth.Organization
    # User
    has_one :user, Pulap.Auth.User,
      on_delete: :nothing
    has_one :role, Pulap.Auth.Role,
      on_delete: :nothing
  end

  require Logger
  require IEx
  @doc false
  def changeset(%UserRole{} = user_role, attrs) do
    user_role
    |> Repo.preload([:organization, :user, :role])
    |> cast(attrs, [:organization_id, :user_id, :role_id, :is_active, :is_logical_deleted])
    |> cast_assoc(:organization)
    |> cast_assoc(:user)
    |> cast_assoc(:role)
    |> validate_required([:organization_id, :user_id, :role_id, :is_active, :is_logical_deleted])
    |> update_name_and_description
  end


  def update_name_and_description(changeset) do
    changes = changeset.changes
    user_username = changes |> get_user_username
    role_name = changes |> get_role_name
    name = user_username <> "_" <> role_name
    changes = changes |> Map.put(:name, name)
    changes = changes |> Map.put(:description, name <> " user-role.")
    %{changeset | changes: changes}
  end

  defp get_user_username(changes) do
    user = changes.user_id |> Auth.get_user!
    user.username 
  end

  defp get_role_name(changes) do
    role = changes.role_id |> Auth.get_role!
    role.name
  end
end
