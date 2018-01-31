defmodule Pulap.Auth.RolePermission do
  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Auth.RolePermission

  schema "role_permissions" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :is_logical_deleted, :boolean, default: false
    field :name, :string
    field :organization_id, Ecto.UUID
    field :role_id, Ecto.UUID
    field :permission_id, Ecto.UUID
    field :created_by, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(%RolePermission{} = role_permission, attrs) do
    role_permission
    |> cast(attrs, [:name, :description, :is_active, :is_logical_deleted])
    |> validate_required([:name, :description, :is_active, :is_logical_deleted])
  end
end
