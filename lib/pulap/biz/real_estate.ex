defmodule Pulap.Biz.RealEstate do
  @moduledoc false

  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Biz.RealEstate

  schema "real_estate" do
    field(:accessible_without_stairs, :boolean, default: false)
    field(:apartment, :string)
    field(:backyard, :boolean, default: false)
    field(:balcony, :boolean, default: false)
    field(:bathroom_area_m2, :float)
    field(:block, :string)
    field(:cards, :string)
    field(:created_by_id, Ecto.UUID)
    field(:currency_code, :string)
    field(:currency_id, :id)
    field(:currency_symbol, :string)
    field(:daily_rent_price, :float)
    field(:description, :string)
    field(:elevator, :boolean, default: false)
    field(:floor, :string)
    field(:furniture_set, :boolean, default: false)
    field(:geo_area_canonical_name, :string)
    field(:geo_area_canonical_name_loc, :string)
    field(:geo_area_id, :id)
    field(:geo_area_name, :string)
    field(:geo_area_name_loc, :string)
    field(:geolocation, Geo.Point)
    field(:heating_type_id, :id)
    field(:heating_type_val_en, :string)
    field(:heating_type_val_loc, :string)
    field(:house_equipment, :boolean, default: false)
    field(:house_equipment_description, :string)
    field(:indoor_area_m2, :float)
    field(:is_active, :boolean, default: false)
    field(:is_logical_deleted, :boolean, default: false)
    field(:kitchen_type_id, :id)
    field(:kitchen_type_val_en, :string)
    field(:kitchen_type_val_loc, :string)
    field(:locale, :string)
    field(:long_term_rent_monthly_price, :float)
    field(:name, :string)
    field(:number_of_balconies, :integer)
    field(:number_of_bathrooms, :integer)
    field(:number_of_bedroms, :integer)
    field(:number_of_rooms, :integer)
    field(:position, :integer)
    field(:property_type_id, :id)
    field(:property_type_val_en, :string)
    field(:property_type_val_loc, :string)
    field(:room_height_cm, :integer)
    field(:sale_price, :float)
    field(:sale_price_per_square_meter, :float)
    field(:short_description, :string)
    field(:street, :string)
    field(:street_number, :string)
    field(:suggested_installment_loan, :float)
    field(:terrace, :boolean, default: false)
    field(:total_area_m2, :float)
    field(:type_of_building_id, :id)
    field(:type_of_building_val_en, :string)
    field(:type_of_building_val_loc, :string)
    field(:updated_by_id, Ecto.UUID)
    field(:year_of_construction, :integer)

    timestamps()
  end

  @doc false
  def changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :accessible_without_stairs,
      :apartment,
      :backyard,
      :balcony,
      :bathroom_area_m2,
      :block,
      :cards,
      :currency_code,
      :currency_symbol,
      :description,
      :elevator,
      :floor,
      :furniture_set,
      :geo_area_canonical_name,
      :geo_area_canonical_name_loc,
      :geo_area_name,
      :geo_area_name_loc,
      :geolocation,
      :heating_type_val_en,
      :heating_type_val_loc,
      :house_equipment,
      :house_equipment_description,
      :indoor_area_m2,
      :is_active,
      :is_logical_deleted,
      :kitchen_type_val_en,
      :kitchen_type_val_loc,
      :locale,
      :long_term_rent_monthly_price,
      :daily_rent_price,
      :name,
      :number_of_balconies,
      :number_of_bathrooms,
      :number_of_bedroms,
      :number_of_rooms,
      :position,
      :sale_price,
      :sale_price_per_square_meter,
      :property_type_val_en,
      :property_type_val_loc,
      :room_height_cm,
      :short_description,
      :street,
      :street_number,
      :suggested_installment_loan,
      :terrace,
      :total_area_m2,
      :type_of_building_val_en,
      :type_of_building_val_loc,
      :year_of_construction
    ])
    |> validate_required([
      :accessible_without_stairs,
      :backyard,
      :balcony,
      :elevator,
      :furniture_set,
      :house_equipment,
      :is_active,
      :is_logical_deleted,
      :name,
      :terrace
    ])
  end

  @doc false
  def edit_presentation_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :name,
      :description
      ])
    |> validate_required([
      :name,
      :description
      ])
  end

  @doc false
  def edit_address_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :administrative_area_level_1,
      :administrative_area_level_2,
      :administrative_area_level_3,
      :administrative_area_level_4,
      :administrative_area_level_5,
      :apartment,
      :block,
      :country,
      :floor,
      :name,
      :postal_code,
      :street,
      :street_number,
      ])
    |> validate_required([
      :administrative_area_level_1,
      #:administrative_area_level_2,
      #:administrative_area_level_3,
      #:administrative_area_level_4,
      #:administrative_area_level_5,
      #:apartment,
      #:block,
      :country,
      #:floor,
      :name,
      #:postal_code,
      #:street,
      #:street_number,
      ])
  end

  @doc false
  def edit_main_features_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :accessible_without_stairs,
      :backyard,
      :bathroom_area_m2,
      :elevator,
      :frontyard,
      :indoor_area_m2,
      :kitchen_type_val_loc,
      :name,
      :number_of_balconies,
      :number_of_bathrooms,
      :number_of_bedroms,
      :number_of_rooms,
      :property_type_val_loc,
      :room_height_cm,
      :terrace,
      :total_area_m2,
      :type_of_building_val_loc,
      :year_of_construction
      ])
    |> validate_required([
      :name,
      :property_type_val_loc
      ])
  end

  @doc false
  def edit_services_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :name,
      :air_conditioning,
      :cable_television,
      :free_to_air_television,
      :heating_type_val_en,
      :internet,
      :internet_television,
      :name,
      :satellite_television,
      :telephone_line,
      :tv_set_type_loc,
      ])
    |> validate_required([
      :name
      ])
  end

  @doc false
  def edit_equipment_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
        :clothes_dryer,
        :dishwasher,
        :furniture_set,
        :furniture_set_description,
        :house_equipment,
        :house_equipment_description,
        :name,
        :washing_machine,
      ])
    |> validate_required([
        :name,
      ])
  end

  @doc false
  def edit_prices_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
        :daily_rent_monthly_price,
        :long_term_rent_monthly_price,
        :sale_price,
        :suggested_installment_loan,
      ])
    |> validate_required([
        :name
      ])
  end
end