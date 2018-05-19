defmodule PulapWeb.GeoAreaControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Geo
  alias Pulap.Geo.GeoArea

  @create_attrs %{
    adm_level: "some adm_level",
    adm_level_type: "some adm_level_type",
    alternative_name: "some alternative_name",
    alternative_name_loc: "some alternative_name_loc",
    canonical_name: "some canonical_name",
    canonical_name_loc: "some canonical_name_loc",
    cards: "some cards",
    dialing_code: "some dialing_code",
    geo_areas: 42,
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    is_main: true,
    locale: "some locale",
    name: "some name",
    name_loc: "some name_loc",
    normalized_name: "some normalized_name",
    position: 42,
    zip_code: "some zip_code"
  }
  @update_attrs %{
    adm_level: "some updated adm_level",
    adm_level_type: "some updated adm_level_type",
    alternative_name: "some updated alternative_name",
    alternative_name_loc: "some updated alternative_name_loc",
    canonical_name: "some updated canonical_name",
    canonical_name_loc: "some updated canonical_name_loc",
    cards: "some updated cards",
    dialing_code: "some updated dialing_code",
    geo_areas: 43,
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    is_main: false,
    locale: "some updated locale",
    name: "some updated name",
    name_loc: "some updated name_loc",
    normalized_name: "some updated normalized_name",
    position: 43,
    zip_code: "some updated zip_code"
  }
  @invalid_attrs %{
    adm_level: nil,
    adm_level_type: nil,
    alternative_name: nil,
    alternative_name_loc: nil,
    canonical_name: nil,
    canonical_name_loc: nil,
    cards: nil,
    dialing_code: nil,
    geo_areas: nil,
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    is_main: nil,
    locale: nil,
    name: nil,
    name_loc: nil,
    normalized_name: nil,
    position: nil,
    zip_code: nil
  }

  def fixture(:geo_area) do
    {:ok, geo_area} = Geo.create_geo_area(@create_attrs)
    geo_area
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all geo_areas", %{conn: conn} do
      conn = get(conn, api_v1_geo_area_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create geo_area" do
    test "renders geo_area when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_geo_area_path(conn, :create), geo_area: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_geo_area_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "adm_level" => "some adm_level",
               "adm_level_type" => "some adm_level_type",
               "alternative_name" => "some alternative_name",
               "alternative_name_loc" => "some alternative_name_loc",
               "canonical_name" => "some canonical_name",
               "canonical_name_loc" => "some canonical_name_loc",
               "cards" => "some cards",
               "dialing_code" => "some dialing_code",
               "geo_areas" => 42,
               # "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "is_main" => true,
               "locale" => "some locale",
               "name" => "some name",
               "name_loc" => "some name_loc",
               "normalized_name" => "some normalized_name",
               "position" => 42,
               "zip_code" => "some zip_code"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_geo_area_path(conn, :create), geo_area: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update geo_area" do
    setup [:create_geo_area]

    test "renders geo_area when data is valid", %{
      conn: conn,
      geo_area: %GeoArea{id: id} = geo_area
    } do
      conn = put(conn, api_v1_geo_area_path(conn, :update, geo_area), geo_area: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_geo_area_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               # "id" => id,
               "adm_level" => "some updated adm_level",
               "adm_level_type" => "some updated adm_level_type",
               "alternative_name" => "some updated alternative_name",
               "alternative_name_loc" => "some updated alternative_name_loc",
               "canonical_name" => "some updated canonical_name",
               "canonical_name_loc" => "some updated canonical_name_loc",
               "cards" => "some updated cards",
               "dialing_code" => "some updated dialing_code",
               "geo_areas" => 43,
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "is_main" => false,
               "locale" => "some updated locale",
               "name" => "some updated name",
               "name_loc" => "some updated name_loc",
               "normalized_name" => "some updated normalized_name",
               "position" => 43,
               "zip_code" => "some updated zip_code"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, geo_area: geo_area} do
      conn = put(conn, api_v1_geo_area_path(conn, :update, geo_area), geo_area: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete geo_area" do
    setup [:create_geo_area]

    test "deletes chosen geo_area", %{conn: conn, geo_area: geo_area} do
      conn = delete(conn, api_v1_geo_area_path(conn, :delete, geo_area))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_geo_area_path(conn, :show, geo_area))
      end)
    end
  end

  defp create_geo_area(_) do
    geo_area = fixture(:geo_area)
    {:ok, geo_area: geo_area}
  end
end
