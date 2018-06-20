defmodule Pulap.Repo.Migrations.CreateRealEstates do
  use Ecto.Migration

  def change do
    create table(:real_estate, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 32, null: false
      add :short_description, :string, size: 128
      add :description, :text
      add :geo_area_name, :string, size: 512
      add :geo_area_name_loc, :string, size: 512
      add :geo_area_canonical_name, :string, size: 512
      add :geo_area_canonical_name_loc, :string, size: 512
      add :country, :string, size: 8
      add :administrative_area_level_1, :string, size: 64
      add :administrative_area_level_1_type, :string, size: 32
      add :administrative_area_level_1_loc, :string, size: 64
      add :administrative_area_level_1_type_loc, :string, size: 32
      add :administrative_area_level_2, :string, size: 64
      add :administrative_area_level_2_type, :string, size: 32
      add :administrative_area_level_2_loc, :string, size: 64
      add :administrative_area_level_2_type_loc, :string, size: 32
      add :administrative_area_level_3, :string, size: 64
      add :administrative_area_level_3_type, :string, size: 32
      add :administrative_area_level_3_loc, :string, size: 64
      add :administrative_area_level_3_type_loc, :string, size: 32
      add :administrative_area_level_4, :string, size: 64
      add :administrative_area_level_4_type, :string, size: 32
      add :administrative_area_level_4_loc, :string, size: 64
      add :administrative_area_level_4_type_loc, :string, size: 32
      add :administrative_area_level_5, :string, size: 64
      add :administrative_area_level_5_type, :string, size: 32
      add :administrative_area_level_5_loc, :string, size: 64
      add :administrative_area_level_5_type_loc, :string, size: 32
      add :street, :string, size: 64
      add :street_number, :string, size: 8
      add :block, :string, size: 32
      add :floor, :string, size: 4
      add :apartment, :string, size: 8
      add :dialing_code, :string, size: 8
      add :postal_code, :string, size: 16
      add :property_type_val_en, :string, size: 16
      add :property_type_val_loc, :string, size: 16
      add :total_area_m2, :float
      add :indoor_area_m2, :float
      add :sale_price, :integer
      add :sale_price_per_square_meter, :integer
      add :long_term_rent_monthly_price, :integer
      add :daily_rent_price, :integer
      add :suggested_installment_loan, :integer
      add :currency_code, :string, size: 4
      add :currency_symbol, :string, size: 4
      add :building_type_val_en, :string, size: 16
      add :building_type_val_loc, :string, size: 16
      add :year_of_construction, :integer
      add :room_height_cm, :integer
      add :number_of_rooms, :integer
      add :number_of_bedroms, :integer
      add :kitchen_type_val_en, :string, size: 16
      add :kitchen_type_val_loc, :string, size: 16
      add :number_of_bathrooms, :integer
      add :bathroom_area_m2, :float
      add :heating_type_val_en, :string, size: 16
      add :heating_type_val_loc, :string, size: 16
      add :air_conditioning, :boolean, default: false, null: false
      add :accessible_without_stairs, :boolean, default: false, null: false
      add :elevator, :boolean, default: false, null: false
      add :terrace, :boolean, default: false, null: false
      add :backyard, :boolean, default: false, null: false
      add :frontyard, :boolean, default: false, null: false
      add :balcony, :boolean, default: false, null: false
      add :number_of_balconies, :integer
      add :furniture_set, :boolean, default: false, null: false
      add :furniture_set_description, :text
      add :house_equipment, :boolean, default: false, null: false
      add :house_equipment_description, :text
      add :dishwasher, :boolean, default: false, null: false
      add :washing_machine, :boolean, default: false, null: false
      add :clothes_dryer, :boolean, default: false, null: false
      add :tv_set_type_eng, :string, size: 16
      add :tv_set_type_loc, :string, size: 16
      add :internet, :boolean, default: false, null: false
      add :cable_television, :boolean, default: false, null: false
      add :satellite_television, :boolean, default: false, null: false
      add :internet_television, :boolean, default: false, null: false
      add :free_to_air_television, :boolean, default: false, null: false
      add :telephone_line, :boolean, default: false, null: false
      add :geolocation, :float
      add :locale, :string
      add :position, :integer
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :geo_area_id, references(:geo_areas, type: :uuid, on_delete: :nothing)
      add :property_type_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :currency_id, references(:currencies, type: :uuid, on_delete: :nothing)
      add :building_type_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :kitchen_type_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :heating_type_id, references(:key_values, type: :uuid, on_delete: :nothing)
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:real_estate, [:country])
    create index(:real_estate, [:geo_area_canonical_name])
    create index(:real_estate, [:geo_area_canonical_name_loc])
    # create index(:real_estate, [:property_type_id])
    # create index(:real_estate, [:currency_id])
    create index(:real_estate, [:building_type_id])
    # create index(:real_estate, [:kitchen_type_id])
    # create index(:real_estate, [:heating_type_id])
    # create index(:real_estate, [:created_by_id])
    # create index(:real_estate, [:updated_by_id])
  end
end
