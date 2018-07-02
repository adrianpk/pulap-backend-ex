defmodule Pulap.Biz.Ownership do
  @moduledoc false

  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Biz.Ownership
  require IEx

  schema "ownerships" do
    # field(:organization_id, Ecto.UUID)
    # field(:real_estate_id, Ecto.UUID)
    # field(:user_id, Ecto.UUID)
    field(:created_by_id, Ecto.UUID)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    field(:is_active, :boolean, default: false)
    field(:is_logical_deleted, :boolean, default: false)
    field(:name, :string)
    field(:started_at, :utc_datetime)
    field(:updated_by_id, Ecto.UUID)

    timestamps()

    belongs_to(:user, Pulap.Auth.User)
    belongs_to(:organization, Pulap.Auth.Organization)
    belongs_to(:real_estate, Pulap.Biz.RealEstate)
  end

  @doc false
  def changeset(%Ownership{} = ownership, attrs) do
    ownership
    |> cast(attrs, [
      :description,
      :ends_at,
      :is_active,
      :is_logical_deleted,
      :name,
      :organization_id,
      :real_estate_id,
      :started_at,
      :user_id
    ])
    |> validate_required([:is_active, :is_logical_deleted])
  end

  @doc false
  def update_changeset_fields(changeset, owner_name, real_estate_name) do
    name = (owner_name <> " - " <> real_estate_name) |> String.downcase()

    changeset
    |> put_change(:name, name)
    |> put_change(:description, name <> " ownership.")
  end
end
