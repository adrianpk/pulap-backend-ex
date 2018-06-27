defmodule Pulap.Biz.Ownership do
  @moduledoc false

  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Biz.Ownership

  schema "ownerships" do
    # field(:organization_id, Ecto.UUID)
    # field(:real_estate_id, Ecto.UUID)
    # field(:user_id, Ecto.UUID)
    field(:created_by_id, Ecto.UUID)
    field(:ends_at, :utc_datetime)
    field(:is_active, :boolean, default: false)
    field(:is_logical_deleted, :boolean, default: false)
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
end
