defmodule PulapWeb.RealEstateControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz
  alias Pulap.Biz.RealEstate
  require Logger

  @create_attrs %{
    id: "7488a646-e31f-11e4-aace-600308960662",
    name: "name",
    short_description: "short_description",
    description: "description",
    geo_area_name: "geo_area",
    geo_area_name_loc: "geo_area_name_loc",
    geo_area_canonical_name: "geo_area_canonical_name",
    geo_area_canonical_name_loc: "geo_area_canonical_name_loc",
    street: "street",
    street_number: "42",
    block: "block",
    floor: "floor",
    apartment: "apartment",
    property_type_val_en: "property_type...",
    property_type_val_loc: "property_type...",
    total_area_m2: 120.5,
    indoor_area_m2: 120.5,
    price: 120.5,
    price_per_square_meter: 120.5,
    suggested_installment_loan: 120.5,
    currency_code: "cur",
    currency_symbol: "cur",
    type_of_building_val_en: "type_of_build...",
    type_of_building_val_loc: "type_of_build...",
    year_of_construction: 42,
    room_height_cm: 42,
    number_of_rooms: 42,
    number_of_bedroms: 42,
    kitchen_type_val_en: "kitchen_type_...",
    kitchen_type_val_loc: "kitchen_type_...",
    number_of_bathrooms: 42,
    bathroom_area_m2: 120.5,
    heating_type_val_en: "heating_type_...",
    heating_type_val_loc: "heating_type_...",
    accessible_without_stairs: true,
    elevator: true,
    terrace: true,
    backyard: true,
    balcony: true,
    number_of_balconies: 42,
    furniture_set: true,
    house_equipment: true,
    house_equipment_description: "house_equipment_description",
    cards: "cards",
    geolocation: nil,
    locale: "locale",
    position: 42,
    is_active: true,
    is_logical_deleted: true,
    geo_area_id: 1,
    property_type_id: 1,
    currency_id: 1,
    type_of_building_id: 1,
    kitchen_type_id: 1,
    heating_type_id: 1,
    created_by_id: 1,
    updated_by_id: 1
  }

  @update_attrs %{
    id: "7488a646-e31f-11e4-aace-600308960662",
    name: "updated name",
    short_description: "updated short_description",
    description: "updated description",
    geo_area_name: "updated geo_a...",
    geo_area_name_loc: "updated geo_a...",
    geo_area_canonical_name: "updated geo_a...",
    geo_area_canonical_name_loc: "updated geo_a...",
    street: "updated street",
    street_number: "43",
    block: "updated block",
    floor: "updated floor",
    apartment: "updated apart...",
    property_type_val_en: "updated prope...",
    property_type_val_loc: "updated prope...",
    total_area_m2: 456.7,
    indoor_area_m2: 456.7,
    price: 456.7,
    price_per_square_meter: 456.7,
    suggested_installment_loan: 456.7,
    currency_code: "upd",
    currency_symbol: "upd",
    type_of_building_val_en: "updated type...",
    type_of_building_val_loc: "updated type_...",
    year_of_construction: 43,
    room_height_cm: 43,
    number_of_rooms: 43,
    number_of_bedroms: 43,
    kitchen_type_val_en: "updated kitch...",
    kitchen_type_val_loc: "updated kitch...",
    number_of_bathrooms: 43,
    bathroom_area_m2: 456.7,
    heating_type_val_en: "updated heati...",
    heating_type_val_loc: "updated heati...",
    accessible_without_stairs: false,
    elevator: false,
    terrace: false,
    backyard: false,
    balcony: false,
    number_of_balconies: 43,
    furniture_set: false,
    house_equipment: false,
    house_equipment_description: "updated house...",
    cards: "updated cards",
    geolocation: nil,
    locale: "updated locale",
    position: 43,
    is_active: false,
    is_logical_deleted: false,
    geo_area_id: 2,
    property_type_id: 2,
    currency_id: 2,
    type_of_building_id: 2,
    kitchen_type_id: 2,
    heating_type_id: 2,
    created_by_id: 2,
    updated_by_id: 2
  }

  @invalid_attrs %{
    id: "7488a646-e31f-11e4-aace-600308960662",
    name: nil,
    short_description: nil,
    description: nil,
    geo_area_name: nil,
    geo_area_name_loc: nil,
    geo_area_canonical_name: nil,
    geo_area_canonical_name_loc: nil,
    street: nil,
    street_number: nil,
    block: nil,
    floor: nil,
    apartment: nil,
    property_type_val_en: nil,
    property_type_val_loc: nil,
    total_area_m2: nil,
    indoor_area_m2: nil,
    price: nil,
    price_per_square_meter: nil,
    suggested_installment_loan: nil,
    currency_code: nil,
    currency_symbol: nil,
    type_of_building_val_en: nil,
    type_of_building_val_loc: nil,
    year_of_construction: nil,
    room_height_cm: nil,
    number_of_rooms: nil,
    number_of_bedroms: nil,
    kitchen_type_val_en: nil,
    kitchen_type_val_loc: nil,
    number_of_bathrooms: nil,
    bathroom_area_m2: nil,
    heating_type_val_en: nil,
    heating_type_val_loc: nil,
    accessible_without_stairs: nil,
    elevator: nil,
    terrace: nil,
    backyard: nil,
    balcony: nil,
    number_of_balconies: nil,
    furniture_set: false,
    house_equipment: false,
    house_equipment_description: nil,
    cards: nil,
    geolocation: nil,
    locale: nil,
    position: nil,
    is_active: true,
    is_logical_deleted: false,
    geo_area_id: nil,
    property_type_id: nil,
    currency_id: nil,
    type_of_building_id: nil,
    kitchen_type_id: nil,
    heating_type_id: nil,
    created_by_id: nil,
    updated_by_id: nil
  }

  def fixture(:real_estate) do
    {:ok, real_estate} = Biz.create_real_estate(@create_attrs)
    real_estate
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all real_estates", %{conn: conn} do
      conn = get(conn, api_v1_real_estate_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create real_estate" do
    test "renders real_estate when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_real_estate_path(conn, :create), real_estate: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_real_estate_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "room_height_cm" => @create_attrs.room_height_cm,
               "number_of_rooms" => @create_attrs.number_of_rooms,
               "backyard" => @create_attrs.backyard,
               "kitchen_type_val_en" => @create_attrs.kitchen_type_val_en,
               "currency_code" => @create_attrs.currency_code,
               "type_of_building_val_en" => @create_attrs.type_of_building_val_en,
               "price" => @create_attrs.price,
               "terrace" => @create_attrs.terrace,
               "kitchen_type_val_loc" => @create_attrs.kitchen_type_val_loc,
               "geolocation" => @create_attrs.geolocation,
               "furniture_set" => @create_attrs.furniture_set,
               "street_number" => @create_attrs.street_number,
               "number_of_bathrooms" => @create_attrs.number_of_bathrooms,
               "geo_area_canonical_name" => @create_attrs.geo_area_canonical_name,
               "short_description" => @create_attrs.short_description,
               "house_equipment_description" => @create_attrs.house_equipment_description,
               "bathroom_area_m2" => @create_attrs.bathroom_area_m2,
               "suggested_installment_loan" => @create_attrs.suggested_installment_loan,
               "property_type_val_en" => @create_attrs.property_type_val_en,
               "locale" => @create_attrs.locale,
               "geo_area_name_loc" => @create_attrs.geo_area_name_loc,
               "balcony" => @create_attrs.balcony,
               "accessible_without_stairs" => @create_attrs.accessible_without_stairs,
               "number_of_balconies" => @create_attrs.number_of_balconies,
               "house_equipment" => @create_attrs.house_equipment,
               "street" => @create_attrs.street,
               "heating_type_val_en" => @create_attrs.heating_type_val_en,
               "geo_area_name" => @create_attrs.geo_area_name,
               "year_of_construction" => @create_attrs.year_of_construction,
               "indoor_area_m2" => @create_attrs.indoor_area_m2,
               "block" => @create_attrs.block,
               "total_area_m2" => @create_attrs.total_area_m2,
               "heating_type_val_loc" => @create_attrs.heating_type_val_loc,
               "currency_symbol" => @create_attrs.currency_symbol,
               "apartment" => @create_attrs.apartment,
               "property_type_val_loc" => @create_attrs.property_type_val_loc,
               "price_per_square_meter" => @create_attrs.price_per_square_meter,
               "description" => @create_attrs.description,
               "number_of_bedroms" => @create_attrs.number_of_bedroms,
               "cards" => @create_attrs.cards,
               "position" => @create_attrs.position,
               "geo_area_canonical_name_loc" => @create_attrs.geo_area_canonical_name_loc,
               "is_logical_deleted" => @create_attrs.is_logical_deleted,
               "is_active" => @create_attrs.is_active,
               "type_of_building_val_loc" => @create_attrs.type_of_building_val_loc,
               "name" => @create_attrs.name,
               "elevator" => @create_attrs.elevator,
               "floor" => @create_attrs.floor
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_real_estate_path(conn, :create), real_estate: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update real_estate" do
    setup [:create_real_estate]

    test "renders real_estate when data is valid", %{
      conn: conn,
      real_estate: %RealEstate{id: id} = real_estate
    } do
      conn =
        put(conn, api_v1_real_estate_path(conn, :update, real_estate), real_estate: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_real_estate_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "room_height_cm" => @update_attrs.room_height_cm,
               "number_of_rooms" => @update_attrs.number_of_rooms,
               "backyard" => @update_attrs.backyard,
               "kitchen_type_val_en" => @update_attrs.kitchen_type_val_en,
               "currency_code" => @update_attrs.currency_code,
               "type_of_building_val_en" => @update_attrs.type_of_building_val_en,
               "price" => @update_attrs.price,
               "terrace" => @update_attrs.terrace,
               "kitchen_type_val_loc" => @update_attrs.kitchen_type_val_loc,
               "geolocation" => @update_attrs.geolocation,
               "furniture_set" => @update_attrs.furniture_set,
               "street_number" => @update_attrs.street_number,
               "number_of_bathrooms" => @update_attrs.number_of_bathrooms,
               "geo_area_canonical_name" => @update_attrs.geo_area_canonical_name,
               "short_description" => @update_attrs.short_description,
               "house_equipment_description" => @update_attrs.house_equipment_description,
               "bathroom_area_m2" => @update_attrs.bathroom_area_m2,
               "suggested_installment_loan" => @update_attrs.suggested_installment_loan,
               "property_type_val_en" => @update_attrs.property_type_val_en,
               "locale" => @update_attrs.locale,
               "geo_area_name_loc" => @update_attrs.geo_area_name_loc,
               "balcony" => @update_attrs.balcony,
               "accessible_without_stairs" => @update_attrs.accessible_without_stairs,
               "number_of_balconies" => @update_attrs.number_of_balconies,
               "house_equipment" => @update_attrs.house_equipment,
               "street" => @update_attrs.street,
               "heating_type_val_en" => @update_attrs.heating_type_val_en,
               "geo_area_name" => @update_attrs.geo_area_name,
               "year_of_construction" => @update_attrs.year_of_construction,
               "indoor_area_m2" => @update_attrs.indoor_area_m2,
               "block" => @update_attrs.block,
               "total_area_m2" => @update_attrs.total_area_m2,
               "heating_type_val_loc" => @update_attrs.heating_type_val_loc,
               "currency_symbol" => @update_attrs.currency_symbol,
               "apartment" => @update_attrs.apartment,
               "property_type_val_loc" => @update_attrs.property_type_val_en,
               "price_per_square_meter" => @update_attrs.price_per_square_meter,
               "description" => @update_attrs.description,
               "number_of_bedroms" => @update_attrs.number_of_bedroms,
               "cards" => @update_attrs.cards,
               "position" => @update_attrs.position,
               "geo_area_canonical_name_loc" => @update_attrs.geo_area_canonical_name_loc,
               "is_logical_deleted" => @update_attrs.is_logical_deleted,
               "is_active" => @update_attrs.is_active,
               "type_of_building_val_loc" => @update_attrs.type_of_building_val_loc,
               "name" => @update_attrs.name,
               "elevator" => @update_attrs.elevator,
               "floor" => @update_attrs.floor
             }
    end

    test "renders errors when data is invalid", %{conn: conn, real_estate: real_estate} do
      conn =
        put(
          conn,
          api_v1_real_estate_path(conn, :update, real_estate),
          real_estate: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete real_estate" do
    setup [:create_real_estate]

    test "deletes chosen real_estate", %{conn: conn, real_estate: real_estate} do
      conn = delete(conn, api_v1_real_estate_path(conn, :delete, real_estate))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_real_estate_path(conn, :show, real_estate))
      end)
    end
  end

  defp create_real_estate(_) do
    real_estate = fixture(:real_estate)
    {:ok, real_estate: real_estate}
  end
end
