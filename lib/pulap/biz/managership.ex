defmodule Pulap.Biz.Managership do
  @moduledoc false
  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Biz.Managership

  schema "managerships" do
    # field(:organization_id, Ecto.UUID)
    # field(:real_estate_id, Ecto.UUID)
    # field(:user_id, Ecto.UUID)
    field(:created_by_id, Ecto.UUID)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    field(:is_active, :boolean, default: false)
    field(:is_logical_deleted, :boolean, default: false)
    field(:is_owner, :boolean, default: false)
    field(:name, :string)
    field(:started_at, :utc_datetime)
    field(:updated_by_id, Ecto.UUID)

    timestamps()

    belongs_to(:user, Pulap.Auth.User)
    belongs_to(:organization, Pulap.Auth.Organization)
    belongs_to(:real_estate, Pulap.Biz.RealEstate)
  end

  @doc false
  def changeset(%Managership{} = managership, attrs) do
    managership
    |> cast(attrs, [
      :user_id,
      :organization_id,
      :real_estate_id,
      :started_at,
      :ends_at,
      :is_active,
      :is_logical_deleted
    ])
    |> validate_required([:is_active, :is_logical_deleted])
  end

  @doc false
  def update_changeset_fields(changeset, manager_name, real_estate_name) do
    name = (manager_name <> " - " <> real_estate_name) |> String.downcase()

    changeset
    |> put_change(:name, name)
    |> put_change(:description, name <> " managership.")
  end
end
