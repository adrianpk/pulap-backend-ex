defmodule Pulap.Auth.Organization do
  @moduledoc false

  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Auth.Organization

  schema "organizations" do
    field(:annotations, :string)
    field(:created_by_id, Ecto.UUID)
    field(:description, :string)
    field(:geolocation, :float)
    field(:is_active, :boolean, default: false)
    field(:is_logical_deleted, :boolean, default: false)
    field(:name, :string)
    field(:owner_id, Ecto.UUID)
    field(:owner_username, :string)
    field(:started_at, :utc_datetime)
    field(:updated_by_id, Ecto.UUID)

    timestamps()

    has_many(:ownerships, Pulap.Biz.Ownership, on_delete: :delete_all)

    many_to_many(
      :owned_real_estates,
      Pulap.Biz.RealEstate,
      join_through: Pulap.Biz.Ownership,
      on_delete: :delete_all
    )

    has_many(:managerships, Pulap.Biz.Managership, on_delete: :delete_all)

    many_to_many(
      :managed_real_estate,
      Pulap.Biz.RealEstate,
      join_through: Pulap.Biz.Managership,
      on_delete: :nothing
    )
  end

  @doc false
  def changeset(%Organization{} = organization, attrs) do
    organization
    |> cast(attrs, [
      :name,
      :description,
      :annotations,
      :geolocation,
      :started_at,
      :is_active,
      :is_logical_deleted,
      :owner_id,
      :owner_username
    ])
    |> validate_required([:name])
  end
end
