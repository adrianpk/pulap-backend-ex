defmodule PulapWeb.API.V1.RealEstateView do
  use PulapWeb, :view
  alias PulapWeb.API.V1.RealEstateView

  def render("index.json", %{real_estates: real_estates}) do
    %{data: render_many(real_estates, RealEstateView, "real_estate.json")}
  end

  def render("show.json", %{real_estate: real_estate}) do
    %{data: render_one(real_estate, RealEstateView, "real_estate.json")}
  end

  def render("real_estate.json", %{real_estate: real_estate}) do
    %{
      id: real_estate.id,
      name: real_estate.name,
      short_description: real_estate.short_description,
      description: real_estate.description,
      geo_area_name: real_estate.geo_area_name,
      geo_area_name_loc: real_estate.geo_area_name_loc,
      geo_area_canonical_name: real_estate.geo_area_canonical_name,
      geo_area_canonical_name_loc: real_estate.geo_area_canonical_name_loc,
      street: real_estate.street,
      street_number: real_estate.street_number,
      block: real_estate.block,
      floor: real_estate.floor,
      apartment: real_estate.apartment,
      property_type_val_en: real_estate.property_type_val_en,
      property_type_val_loc: real_estate.property_type_val_loc,
      total_area_m2: real_estate.total_area_m2,
      indoor_area_m2: real_estate.indoor_area_m2,
      price: real_estate.price,
      price_per_square_meter: real_estate.price_per_square_meter,
      suggested_installment_loan: real_estate.suggested_installment_loan,
      building_type_val_en: real_estate.building_type_val_en,
      building_type_val_loc: real_estate.building_type_val_loc,
      year_of_construction: real_estate.year_of_construction,
      room_height_cm: real_estate.room_height_cm,
      number_of_rooms: real_estate.number_of_rooms,
      number_of_bedroms: real_estate.number_of_bedroms,
      kitchen_type_val_en: real_estate.kitchen_type_val_en,
      kitchen_type_val_loc: real_estate.kitchen_type_val_loc,
      number_of_bathrooms: real_estate.number_of_bathrooms,
      bathroom_area_m2: real_estate.bathroom_area_m2,
      heating_type_val_en: real_estate.heating_type_val_en,
      heating_type_val_loc: real_estate.heating_type_val_loc,
      accessible_without_stairs: real_estate.accessible_without_stairs,
      elevator: real_estate.elevator,
      terrace: real_estate.terrace,
      backyard: real_estate.backyard,
      balcony: real_estate.balcony,
      number_of_balconies: real_estate.number_of_balconies,
      furniture_set: real_estate.furniture_set,
      house_equipment: real_estate.house_equipment,
      house_equipment_description: real_estate.house_equipment_description,
      geolocation: real_estate.geolocation,
      locale: real_estate.locale,
      position: real_estate.position,
      is_active: real_estate.is_active,
      is_logical_deleted: real_estate.is_logical_deleted,
      currency_code: real_estate.currency_code,
      currency_symbol: real_estate.currency_symbol
    }
  end
end
