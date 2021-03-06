defmodule Pulap.Biz.RealEstate do
  @moduledoc false

  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.Biz.RealEstate
  alias Pulap.App.KeyValue.Context, as: KeyValueContext
  require IEx

  schema "real_estate" do
    # field(:geolocation, Geo.Point)
    field(:accessible_without_stairs, :boolean, default: false)
    field(:administrative_area_level_1, :string)
    field(:administrative_area_level_1_loc, :string)
    field(:administrative_area_level_1_type, :string)
    field(:administrative_area_level_1_type_loc, :string)
    field(:administrative_area_level_2, :string)
    field(:administrative_area_level_2_loc, :string)
    field(:administrative_area_level_2_type, :string)
    field(:administrative_area_level_2_type_loc, :string)
    field(:administrative_area_level_3, :string)
    field(:administrative_area_level_3_loc, :string)
    field(:administrative_area_level_3_type, :string)
    field(:administrative_area_level_3_type_loc, :string)
    field(:administrative_area_level_4, :string)
    field(:administrative_area_level_4_loc, :string)
    field(:administrative_area_level_4_type, :string)
    field(:administrative_area_level_4_type_loc, :string)
    field(:administrative_area_level_5, :string)
    field(:administrative_area_level_5_loc, :string)
    field(:administrative_area_level_5_type, :string)
    field(:administrative_area_level_5_type_loc, :string)
    field(:air_conditioning, :boolean, default: false)
    field(:apartment, :string)
    field(:backyard, :boolean, default: false)
    field(:balcony, :boolean, default: false)
    field(:bathroom_area_m2, :float)
    field(:block, :string)
    field(:cable_television, :boolean, default: false)
    field(:clothes_dryer, :boolean, default: false)
    field(:country, :string)
    field(:created_by_id, Ecto.UUID)
    field(:currency_code, :string)
    field(:currency_id, :id)
    field(:currency_symbol, :string)
    field(:daily_rent_price, :integer)
    field(:description, :string)
    field(:dishwasher, :boolean, default: false)
    field(:elevator, :boolean, default: false)
    field(:floor, :string)
    field(:free_to_air_television, :boolean, default: false)
    field(:frontyard, :boolean, default: false)
    field(:furniture_set, :boolean, default: false)
    field(:furniture_set_description, :string)
    field(:geo_area_canonical_name, :string)
    field(:geo_area_canonical_name_loc, :string)
    field(:geo_area_id, :id)
    field(:geo_area_name, :string)
    field(:geo_area_name_loc, :string)
    field(:heating_type_id, :id)
    field(:heating_type_val_en, :string)
    field(:heating_type_val_loc, :string)
    field(:house_equipment, :boolean, default: false)
    field(:house_equipment_description, :string)
    field(:indoor_area_m2, :float)
    field(:internet, :boolean, default: false)
    field(:internet_television, :boolean, default: false)
    field(:is_active, :boolean, default: false)
    field(:is_logical_deleted, :boolean, default: false)
    field(:kitchen_type_id, Ecto.UUID)
    field(:kitchen_type_val_en, :string)
    field(:kitchen_type_val_loc, :string)
    field(:locale, :string)
    field(:long_term_rent_monthly_price, :integer)
    field(:name, :string)
    field(:number_of_balconies, :integer)
    field(:number_of_bathrooms, :integer)
    field(:number_of_bedroms, :integer)
    field(:number_of_rooms, :integer)
    field(:position, :integer)
    field(:postal_code, :string)
    field(:property_type_id, Ecto.UUID)
    field(:property_type_val_en, :string)
    field(:property_type_val_loc, :string)
    field(:room_height_cm, :integer)
    field(:sale_price, :integer)
    field(:sale_price_per_square_meter, :integer)
    field(:satellite_television, :boolean, default: false)
    field(:short_description, :string)
    field(:street, :string)
    field(:street_number, :string)
    field(:suggested_installment_loan, :integer)
    field(:telephone_line, :boolean, default: false)
    field(:terrace, :boolean, default: false)
    field(:total_area_m2, :float)
    field(:tv_set_type_loc, :string)
    field(:building_type_id, Ecto.UUID)
    field(:building_type_val_en, :string)
    field(:building_type_val_loc, :string)
    field(:updated_by_id, Ecto.UUID)
    field(:washing_machine, :boolean, default: false)
    field(:year_of_construction, :integer)

    timestamps()

    has_many(:managerships, Pulap.Biz.Managership, on_delete: :delete_all)

    has_one(:property_type, Pulap.App.KeyValue, on_delete: :nothing)
    has_one(:building_type, Pulap.App.KeyValue, on_delete: :nothing)
    has_one(:kitchen_type, Pulap.App.KeyValue, on_delete: :nothing)
  end

  @doc false
  def changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :accessible_without_stairs,
      :administrative_area_level_1,
      :administrative_area_level_1_loc,
      :administrative_area_level_1_type,
      :administrative_area_level_1_type_loc,
      :administrative_area_level_2,
      :administrative_area_level_2_loc,
      :administrative_area_level_2_type,
      :administrative_area_level_2_type_loc,
      :administrative_area_level_3,
      :administrative_area_level_3_loc,
      :administrative_area_level_3_type,
      :administrative_area_level_3_type_loc,
      :administrative_area_level_4,
      :administrative_area_level_4_loc,
      :administrative_area_level_4_type,
      :administrative_area_level_4_type_loc,
      :administrative_area_level_5,
      :administrative_area_level_5_loc,
      :administrative_area_level_5_type,
      :administrative_area_level_5_type_loc,
      :air_conditioning,
      :apartment,
      :backyard,
      :balcony,
      :bathroom_area_m2,
      :block,
      :cable_television,
      :clothes_dryer,
      :country,
      :created_by_id,
      :currency_code,
      :currency_id,
      :currency_symbol,
      :daily_rent_price,
      :description,
      :dishwasher,
      :elevator,
      :floor,
      :free_to_air_television,
      :frontyard,
      :furniture_set,
      :furniture_set_description,
      :geo_area_canonical_name,
      :geo_area_canonical_name_loc,
      :geo_area_id,
      :geo_area_name,
      :geo_area_name_loc,
      :heating_type_id,
      :house_equipment,
      :house_equipment_description,
      :indoor_area_m2,
      :internet,
      :internet_television,
      :is_active,
      :is_logical_deleted,
      :kitchen_type_id,
      :locale,
      :long_term_rent_monthly_price,
      :name,
      :number_of_balconies,
      :number_of_bathrooms,
      :number_of_bedroms,
      :number_of_rooms,
      :position,
      :postal_code,
      :property_type_id,
      :room_height_cm,
      :sale_price,
      :sale_price_per_square_meter,
      :satellite_television,
      :short_description,
      :street,
      :street_number,
      :suggested_installment_loan,
      :telephone_line,
      :terrace,
      :total_area_m2,
      :tv_set_type_loc,
      :building_type_id,
      :updated_by_id,
      :washing_machine,
      :year_of_construction
    ])
    |> validate_required([
      # :accessible_without_stairs,
      # :administrative_area_level_1,
      # :administrative_area_level_1_loc,
      # :administrative_area_level_1_type,
      # :administrative_area_level_1_type_loc,
      # :administrative_area_level_2,
      # :administrative_area_level_2_loc,
      # :administrative_area_level_2_type,
      # :administrative_area_level_2_type_loc,
      # :administrative_area_level_3,
      # :administrative_area_level_3_loc,
      # :administrative_area_level_3_type,
      # :administrative_area_level_3_type_loc,
      # :administrative_area_level_4,
      # :administrative_area_level_4_loc,
      # :administrative_area_level_4_type,
      # :administrative_area_level_4_type_loc,
      # :administrative_area_level_5,
      # :administrative_area_level_5_loc,
      # :administrative_area_level_5_type,
      # :administrative_area_level_5_type_loc,
      # :air_conditioning,
      # :apartment,
      # :backyard,
      # :balcony,
      # :bathroom_area_m2,
      # :block,
      # :cable_television,
      # :clothes_dryer,
      # :country,
      # :created_by_id,
      # :currency_code,
      # :currency_id,
      # :currency_symbol,
      # :daily_rent_price,
      # :description,
      # :dishwasher,
      # :elevator,
      # :floor,
      # :free_to_air_television,
      # :frontyard,
      # :furniture_set,
      # :furniture_set_description,
      # :geo_area_canonical_name,
      # :geo_area_canonical_name_loc,
      # :geo_area_id,
      # :geo_area_name,
      # :geo_area_name_loc,
      # :heating_type_id,
      # :heating_type_val_en,
      # :heating_type_val_loc,
      # :house_equipment,
      # :house_equipment_description,
      # :indoor_area_m2,
      # :internet,
      # :internet_television,
      # :is_active,
      # :is_logical_deleted,
      # :kitchen_type_id,
      # :kitchen_type_val_en,
      # :kitchen_type_val_loc,
      # :locale,
      # :long_term_rent_monthly_price,
      :name
      # :number_of_balconies,
      # :number_of_bathrooms,
      # :number_of_bedroms,
      # :number_of_rooms,
      # :position,
      # :postal_code,
      # :property_type_id,
      # :property_type_val_en,
      # :property_type_val_loc,
      # :room_height_cm,
      # :sale_price,
      # :sale_price_per_square_meter,
      # :satellite_television,
      # :short_description,
      # :street,
      # :street_number,
      # :suggested_installment_loan,
      # :telephone_line,
      # :terrace,
      # :total_area_m2,
      # :tv_set_type_loc,
      # :building_type_id,
      # :building_type_val_en,
      # :building_type_val_loc,
      # :updated_by_id,
      # :washing_machine,
      # :year_of_construction
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
      :street_number
    ])
    |> validate_required([
      :administrative_area_level_1,
      :administrative_area_level_2,
      :administrative_area_level_3,
      # :administrative_area_level_4,
      # :administrative_area_level_5,
      # :apartment,
      # :block,
      :country,
      # :floor,
      :name
      # :postal_code,
      # :street,
      # :street_number,
    ])
    |> update_geo_area
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
      :kitchen_type_id,
      :name,
      :number_of_balconies,
      :number_of_bathrooms,
      :number_of_bedroms,
      :number_of_rooms,
      :property_type_id,
      :room_height_cm,
      :terrace,
      :total_area_m2,
      :building_type_id,
      :year_of_construction
    ])
    |> cast_assoc(:property_type, required: false)
    |> cast_assoc(:building_type, required: false)
    |> cast_assoc(:kitchen_type, required: false)
    # |> validate_required([
    #   :name,
    #   :property_type_id,
    #   :building_type_id,
    #   :kitchen_type_id
    # ])
    |> retrieve_human_readable([
      :property_type_id,
      :building_type_id,
      :kitchen_type_id
    ])
  end

  @doc false
  def edit_services_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :air_conditioning,
      :cable_television,
      :free_to_air_television,
      :heating_type_id,
      :internet,
      :internet_television,
      :name,
      :satellite_television,
      :telephone_line,
      :tv_set_type_id
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
      :washing_machine
    ])
    |> validate_required([
      :name
    ])
  end

  @doc false
  def edit_prices_changeset(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> cast(attrs, [
      :name,
      :daily_rent_price,
      :long_term_rent_monthly_price,
      :sale_price,
      :suggested_installment_loan
    ])
    |> validate_required([
      :name
    ])
    |> validate_price(:sale_price)
    |> validate_price(:daily_rent_price)
    |> validate_price(:long_term_rent_monthly_price)
  end

  def validate_price(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, price ->
      case price > 0 do
        true ->
          []

        false ->
          [{field, options[:message] || "Must be greater than 0"}]
      end
    end)
  end

  def retrieve_human_readable(changeset, fields) when is_list(fields) do
    # changed_keys = changeset.changes |> Map.keys
    # to_process = Enum.filter(changed_keys, fn el -> Enum.member?(fields, el) end) 
    to_process =
      changeset.changes
      |> Map.keys()
      |> Enum.filter(fn el -> Enum.member?(fields, el) end)

    changeset =
      to_process
      |> Enum.map(&retrieve_human_readable(changeset, &1))

    changeset =
      case length(fields) do
        0 ->
          changeset

        1 ->
          retrieve_human_readable(changeset, List.first(fields))

        _ ->
          retrieve_human_readable(changeset, List)
      end

    # Para cada field en fields que que esté en chageset.cahnges
    IEx.pry()
    changeset
  end

  def retrieve_human_readable(changeset, field) do
    # El id me permite obtener un keyvalue
    id_result =
      changeset.changes
      |> Map.fetch(field)

    key_value =
      case id_result do
        {:ok, id} ->
          KeyValueContext.get!(id)

        {:error, _} ->
          nil
      end

    # El keyvalue me permite obtener un triplete set-key-locale
    # Si el locale no es key 'en_US'
    changeset =
      case key_value.locale do
        "en_US" ->
          put_change(changeset, val_en_field_name(field), key_value.value)

        _ ->
          put_change(changeset, val_loc_field_name(field), key_value.value)
      end

    ##  Busco un locale de  la forma set-key-'en_US'
    ## Si lo encuentro con el keyvalue.value seteo el changeset.field_vai_en
    # Si el locale es 'en_US'
    ## Con el keyvalue.value lo seteo en el changeset.field_val_val_loc
    changeset
  end

  defp val_en_field_name(field_name) when is_atom(field_name) do
    (Atom.to_string(field_name) <> "_val_en")
    |> String.to_atom()
  end

  defp val_loc_field_name(field_name) when is_atom(field_name) do
    (Atom.to_string(field_name) <> "_val_loc")
    |> String.to_atom()
  end

  def update_geo_area(changeset) do
    # TODO: Update GeoArea
    # Get country + Administrative levels
    # Concatenate: "Country - Adm. Level 1 - (...) Adm. Level 3"
    changeset
  end
end
