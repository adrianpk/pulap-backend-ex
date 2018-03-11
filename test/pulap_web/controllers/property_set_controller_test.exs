defmodule PulapWeb.PropertySetControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App
  alias Pulap.App.PropertySet

  @create_attrs %{description: "some description", holder_id: "7488a646-e31f-11e4-aace-600308960662", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: "some is_logical_deleted", name: "some name"}
  @update_attrs %{description: "some updated description", holder_id: "7488a646-e31f-11e4-aace-600308960668", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: "some updated is_logical_deleted", name: "some updated name"}
  @invalid_attrs %{description: nil, holder_id: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil}

  def fixture(:property_set) do
    {:ok, property_set} = App.create_property_set(@create_attrs)
    property_set
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all property_sets", %{conn: conn} do
      conn = get conn, api_v1_property_set_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create property_set" do
    test "renders property_set when data is valid", %{conn: conn} do
      conn = post conn, api_v1_property_set_path(conn, :create), property_set: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_v1_property_set_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "holder_id" => "7488a646-e31f-11e4-aace-600308960662",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => "some is_logical_deleted",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_v1_property_set_path(conn, :create), property_set: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update property_set" do
    setup [:create_property_set]

    test "renders property_set when data is valid", %{conn: conn, property_set: %PropertySet{id: id} = property_set} do
      conn = put conn, api_v1_property_set_path(conn, :update, property_set), property_set: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_v1_property_set_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "holder_id" => "7488a646-e31f-11e4-aace-600308960668",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => "some updated is_logical_deleted",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, property_set: property_set} do
      conn = put conn, api_v1_property_set_path(conn, :update, property_set), property_set: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete property_set" do
    setup [:create_property_set]

    test "deletes chosen property_set", %{conn: conn, property_set: property_set} do
      conn = delete conn, api_v1_property_set_path(conn, :delete, property_set)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_v1_property_set_path(conn, :show, property_set)
      end
    end
  end

  defp create_property_set(_) do
    property_set = fixture(:property_set)
    {:ok, property_set: property_set}
  end
end
