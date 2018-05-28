defmodule Pulap.Repo.Migrations.CreateGeoAreas do
  use Ecto.Migration

  def up do
    create table(:geo_areas, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 64, null: false
      add :name_loc, :string, size: 64
      add :alternative_name, :string, size: 64
      add :alternative_name_loc, :string, size: 64
      add :colloquial_area_name, :string, size: 64
      add :canonical_name, :string, size: 255, null: false
      add :canonical_name_loc, :string, size: 255, null: false
      add :normalized_name, :string, size: 64
      add :administrative_area_level, :string, size: 8, null: false
      add :administrative_area_level_type, :string, size: 16, null: false
      # locality
      # ward
      # sublocality
      # neighborhood
      # premise
      # subpremise
      # natural_feature
      # airport
      # park
      # point_of_interest
      add :dialing_code, :string
      add :postal_code, :string
      # place_id - Google unique identifier for this place
      # location_type - ROOFTOP / RANGE_INTERPOLATED / GEOMETRIC_CENTER / APPROXIMATE
      # viewport - recommended viewport for the returned result.
      # bounds - stores the LatLngBounds which can fully contain the returned result.
      add :is_main, :boolean, default: false, null: false
      add :cards, :jsonb
    end

    execute("SELECT AddGeometryColumn ('geo_areas', 'geolocation', 4326, 'POINT', 2);")

    alter table(:geo_areas) do
      add :locale, :string
      add :position, :integer
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :parent_id, references(:geo_areas, type: :uuid, on_delete: :nothing)
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:geo_areas, [:canonical_name])
    create unique_index(:geo_areas, [:canonical_name_loc])
    create index(:geo_areas, [:parent_id])
    create index(:geo_areas, [:name])
    create index(:geo_areas, [:name_loc])
    create index(:geo_areas, [:created_by_id])
    create index(:geo_areas, [:updated_by_id])

  end

  def down do
    drop table("geo_areas")
  end
end
