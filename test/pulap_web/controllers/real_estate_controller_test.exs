defmodule PulapWeb.RealEstateControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz
  alias Pulap.Biz.RealEstate

  @create_attrs %{room_height_cm: 42, number_of_rooms: 42, backyard: true, kitchen_type_val_en: "some kitchen_type_val_en", currency_code: "some currency_code", type_of_building_val_en: "some type_of_building_val_en", id: "7488a646-e31f-11e4-aace-600308960662", price: 120.5, "": "some ", terrace: true, kitchen_type_val_loc: "some kitchen_type_val_loc", geolocation: 120.5, furniture_set: true, street_number: "some street_number", number_of_bathrooms: 42, geo_area_canonical_name: "some geo_area_canonical_name", short_description: "some short_description", house_equipment_description: "some house_equipment_description", bathroom_area_m2: 120.5, suggested_installment_loan: 120.5, property_type_val_end: "some property_type_val_end", locale: "some locale", geo_area_name_loc: "some geo_area_name_loc", balcony: true, accessible_without_stairs: true, number_of_balconies: 42, house_equipment: true, "street,": "some street,", heating_type_val_en: "some heating_type_val_en", geo_area_name: "some geo_area_name", year_of_construction: 42, indoor_area_m2: 120.5, block: "some block", total_area_m2: 120.5, heating_type_val_loc: "some heating_type_val_loc", currency_symbol: "some currency_symbol", apartment: "some apartment", property_type_val_loc: "some property_type_val_loc", price_per_square_meter: 120.5, description: "some description", active: true, number_of_bedroms: 42, cards: "some cards", position: 42, geo_area_canonical_name_loc: "some geo_area_canonical_name_loc", is_logical_deleted: true, is_active: true, type_of_building_val_loc: "some type_of_building_val_loc", name: "some name", logical_deleted: true, ...}
  @update_attrs %{room_height_cm: 43, number_of_rooms: 43, backyard: false, kitchen_type_val_en: "some updated kitchen_type_val_en", currency_code: "some updated currency_code", type_of_building_val_en: "some updated type_of_building_val_en", id: "7488a646-e31f-11e4-aace-600308960668", price: 456.7, "": "some updated ", terrace: false, kitchen_type_val_loc: "some updated kitchen_type_val_loc", geolocation: 456.7, furniture_set: false, street_number: "some updated street_number", number_of_bathrooms: 43, geo_area_canonical_name: "some updated geo_area_canonical_name", short_description: "some updated short_description", house_equipment_description: "some updated house_equipment_description", bathroom_area_m2: 456.7, suggested_installment_loan: 456.7, property_type_val_end: "some updated property_type_val_end", locale: "some updated locale", geo_area_name_loc: "some updated geo_area_name_loc", balcony: false, accessible_without_stairs: false, number_of_balconies: 43, house_equipment: false, "street,": "some updated street,", heating_type_val_en: "some updated heating_type_val_en", geo_area_name: "some updated geo_area_name", year_of_construction: 43, indoor_area_m2: 456.7, block: "some updated block", total_area_m2: 456.7, heating_type_val_loc: "some updated heating_type_val_loc", currency_symbol: "some updated currency_symbol", apartment: "some updated apartment", property_type_val_loc: "some updated property_type_val_loc", price_per_square_meter: 456.7, description: "some updated description", active: false, number_of_bedroms: 43, cards: "some updated cards", position: 43, geo_area_canonical_name_loc: "some updated geo_area_canonical_name_loc", is_logical_deleted: false, is_active: false, type_of_building_val_loc: "some updated type_of_building_val_loc", name: "some updated name", logical_deleted: false, ...}
  @invalid_attrs %{room_height_cm: nil, number_of_rooms: nil, backyard: nil, kitchen_type_val_en: nil, currency_code: nil, type_of_building_val_en: nil, id: nil, price: nil, "": nil, terrace: nil, kitchen_type_val_loc: nil, geolocation: nil, furniture_set: nil, street_number: nil, number_of_bathrooms: nil, geo_area_canonical_name: nil, short_description: nil, house_equipment_description: nil, bathroom_area_m2: nil, suggested_installment_loan: nil, property_type_val_end: nil, locale: nil, geo_area_name_loc: nil, balcony: nil, accessible_without_stairs: nil, number_of_balconies: nil, house_equipment: nil, "street,": nil, heating_type_val_en: nil, geo_area_name: nil, year_of_construction: nil, indoor_area_m2: nil, block: nil, total_area_m2: nil, heating_type_val_loc: nil, currency_symbol: nil, apartment: nil, property_type_val_loc: nil, price_per_square_meter: nil, description: nil, active: nil, number_of_bedroms: nil, cards: nil, position: nil, geo_area_canonical_name_loc: nil, is_logical_deleted: nil, is_active: nil, type_of_building_val_loc: nil, name: nil, logical_deleted: nil, ...}

  def fixture(:real_estate) do
    {:ok, real_estate} = Biz.create_real_estate(@create_attrs)
    real_estate
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all real_estates", %{conn: conn} do
      conn = get conn, real_estate_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create real_estate" do
    test "renders real_estate when data is valid", %{conn: conn} do
      conn = post conn, real_estate_path(conn, :create), real_estate: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, real_estate_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "room_height_cm" => 42,
        "number_of_rooms" => 42,
        "backyard" => true,
        "kitchen_type_val_en" => "some kitchen_type_val_en",
        "currency_code" => "some currency_code",
        "type_of_building_val_en" => "some type_of_building_val_en",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "price" => 120.5,
        "" => "some ",
        "terrace" => true,
        "kitchen_type_val_loc" => "some kitchen_type_val_loc",
        "geolocation" => 120.5,
        "furniture_set" => true,
        "street_number" => "some street_number",
        "number_of_bathrooms" => 42,
        "geo_area_canonical_name" => "some geo_area_canonical_name",
        "short_description" => "some short_description",
        "house_equipment_description" => "some house_equipment_description",
        "bathroom_area_m2" => 120.5,
        "suggested_installment_loan" => 120.5,
        "property_type_val_end" => "some property_type_val_end",
        "locale" => "some locale",
        "geo_area_name_loc" => "some geo_area_name_loc",
        "balcony" => true,
        "accessible_without_stairs" => true,
        "number_of_balconies" => 42,
        "house_equipment" => true,
        "street," => "some street,",
        "heating_type_val_en" => "some heating_type_val_en",
        "geo_area_name" => "some geo_area_name",
        "year_of_construction" => 42,
        "indoor_area_m2" => 120.5,
        "block" => "some block",
        "total_area_m2" => 120.5,
        "heating_type_val_loc" => "some heating_type_val_loc",
        "currency_symbol" => "some currency_symbol",
        "apartment" => "some apartment",
        "property_type_val_loc" => "some property_type_val_loc",
        "price_per_square_meter" => 120.5,
        "description" => "some description",
        "active" => true,
        "number_of_bedroms" => 42,
        "cards" => "some cards",
        "position" => 42,
        "geo_area_canonical_name_loc" => "some geo_area_canonical_name_loc",
        "is_logical_deleted" => true,
        "is_active" => true,
        "type_of_building_val_loc" => "some type_of_building_val_loc",
        "name" => "some name",
        "logical_deleted" => true,
        "elevator" => true,
        "floor" => "some floor"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, real_estate_path(conn, :create), real_estate: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update real_estate" do
    setup [:create_real_estate]

    test "renders real_estate when data is valid", %{conn: conn, real_estate: %RealEstate{id: id} = real_estate} do
      conn = put conn, real_estate_path(conn, :update, real_estate), real_estate: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, real_estate_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "room_height_cm" => 43,
        "number_of_rooms" => 43,
        "backyard" => false,
        "kitchen_type_val_en" => "some updated kitchen_type_val_en",
        "currency_code" => "some updated currency_code",
        "type_of_building_val_en" => "some updated type_of_building_val_en",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "price" => 456.7,
        "" => "some updated ",
        "terrace" => false,
        "kitchen_type_val_loc" => "some updated kitchen_type_val_loc",
        "geolocation" => 456.7,
        "furniture_set" => false,
        "street_number" => "some updated street_number",
        "number_of_bathrooms" => 43,
        "geo_area_canonical_name" => "some updated geo_area_canonical_name",
        "short_description" => "some updated short_description",
        "house_equipment_description" => "some updated house_equipment_description",
        "bathroom_area_m2" => 456.7,
        "suggested_installment_loan" => 456.7,
        "property_type_val_end" => "some updated property_type_val_end",
        "locale" => "some updated locale",
        "geo_area_name_loc" => "some updated geo_area_name_loc",
        "balcony" => false,
        "accessible_without_stairs" => false,
        "number_of_balconies" => 43,
        "house_equipment" => false,
        "street," => "some updated street,",
        "heating_type_val_en" => "some updated heating_type_val_en",
        "geo_area_name" => "some updated geo_area_name",
        "year_of_construction" => 43,
        "indoor_area_m2" => 456.7,
        "block" => "some updated block",
        "total_area_m2" => 456.7,
        "heating_type_val_loc" => "some updated heating_type_val_loc",
        "currency_symbol" => "some updated currency_symbol",
        "apartment" => "some updated apartment",
        "property_type_val_loc" => "some updated property_type_val_loc",
        "price_per_square_meter" => 456.7,
        "description" => "some updated description",
        "active" => false,
        "number_of_bedroms" => 43,
        "cards" => "some updated cards",
        "position" => 43,
        "geo_area_canonical_name_loc" => "some updated geo_area_canonical_name_loc",
        "is_logical_deleted" => false,
        "is_active" => false,
        "type_of_building_val_loc" => "some updated type_of_building_val_loc",
        "name" => "some updated name",
        "logical_deleted" => false,
        "elevator" => false,
        "floor" => "some updated floor"}
    end

    test "renders errors when data is invalid", %{conn: conn, real_estate: real_estate} do
      conn = put conn, real_estate_path(conn, :update, real_estate), real_estate: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete real_estate" do
    setup [:create_real_estate]

    test "deletes chosen real_estate", %{conn: conn, real_estate: real_estate} do
      conn = delete conn, real_estate_path(conn, :delete, real_estate)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, real_estate_path(conn, :show, real_estate)
      end
    end
  end

  defp create_real_estate(_) do
    real_estate = fixture(:real_estate)
    {:ok, real_estate: real_estate}
  end
end
