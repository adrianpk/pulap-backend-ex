defmodule PulapWeb.PropertyControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App
  alias Pulap.App.Property

  @create_attrs %{boolean: true, date: ~D[2010-04-17], datetime: ~N[2010-04-17 14:00:00.000000], decimal: "120.5", description: "some description", float: 120.5, geolocation: 120.5, id: "7488a646-e31f-11e4-aace-600308960662", integer: 42, is_active: true, is_logical_deleted: true, name: "some name", property_data_type: "some property_data_type", property_set_name: "some property_set_name", string: "some string", time: ~T[14:00:00.000000], uuid: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{boolean: false, date: ~D[2011-05-18], datetime: ~N[2011-05-18 15:01:01.000000], decimal: "456.7", description: "some updated description", float: 456.7, geolocation: 456.7, id: "7488a646-e31f-11e4-aace-600308960668", integer: 43, is_active: false, is_logical_deleted: false, name: "some updated name", property_data_type: "some updated property_data_type", property_set_name: "some updated property_set_name", string: "some updated string", time: ~T[15:01:01.000000], uuid: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{boolean: nil, date: nil, datetime: nil, decimal: nil, description: nil, float: nil, geolocation: nil, id: nil, integer: nil, is_active: nil, is_logical_deleted: nil, name: nil, property_data_type: nil, property_set_name: nil, string: nil, time: nil, uuid: nil}

  def fixture(:property) do
    {:ok, property} = App.create_property(@create_attrs)
    property
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all properties", %{conn: conn} do
      conn = get conn, api_v1_property_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create property" do
    test "renders property when data is valid", %{conn: conn} do
      conn = post conn, api_v1_property_path(conn, :create), property: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_v1_property_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "boolean" => true,
        "date" => ~D[2010-04-17],
        "datetime" => ~N[2010-04-17 14:00:00.000000],
        "decimal" => "120.5",
        "description" => "some description",
        "float" => 120.5,
        "geolocation" => 120.5,
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "integer" => 42,
        "is_active" => true,
        "is_logical_deleted" => true,
        "name" => "some name",
        "property_data_type" => "some property_data_type",
        "property_set_name" => "some property_set_name",
        "string" => "some string",
        "time" => ~T[14:00:00.000000],
        "uuid" => "7488a646-e31f-11e4-aace-600308960662"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_v1_property_path(conn, :create), property: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update property" do
    setup [:create_property]

    test "renders property when data is valid", %{conn: conn, property: %Property{id: id} = property} do
      conn = put conn, api_v1_property_path(conn, :update, property), property: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_v1_property_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "boolean" => false,
        "date" => ~D[2011-05-18],
        "datetime" => ~N[2011-05-18 15:01:01.000000],
        "decimal" => "456.7",
        "description" => "some updated description",
        "float" => 456.7,
        "geolocation" => 456.7,
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "integer" => 43,
        "is_active" => false,
        "is_logical_deleted" => false,
        "name" => "some updated name",
        "property_data_type" => "some updated property_data_type",
        "property_set_name" => "some updated property_set_name",
        "string" => "some updated string",
        "time" => ~T[15:01:01.000000],
        "uuid" => "7488a646-e31f-11e4-aace-600308960668"}
    end

    test "renders errors when data is invalid", %{conn: conn, property: property} do
      conn = put conn, api_v1_property_path(conn, :update, property), property: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete property" do
    setup [:create_property]

    test "deletes chosen property", %{conn: conn, property: property} do
      conn = delete conn, api_v1_property_path(conn, :delete, property)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_v1_property_path(conn, :show, property)
      end
    end
  end

  defp create_property(_) do
    property = fixture(:property)
    {:ok, property: property}
  end
end
