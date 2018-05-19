defmodule PulapWeb.KeyValueControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.App
  alias Pulap.App.KeyValue

  @create_attrs %{
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    key: "some key",
    key_group: "some key_group",
    key_subgroup: "some key_subgroup",
    locale: "some locale",
    position: 42,
    set: "some set",
    value: "some value"
  }
  @update_attrs %{
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    key: "some updated key",
    key_group: "some updated key_group",
    key_subgroup: "some updated key_subgroup",
    locale: "some updated locale",
    position: 43,
    set: "some updated set",
    value: "some updated value"
  }
  @invalid_attrs %{
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    key: nil,
    key_group: nil,
    key_subgroup: nil,
    locale: nil,
    position: nil,
    set: nil,
    value: nil
  }

  def fixture(:key_value) do
    {:ok, key_value} = App.create_key_value(@create_attrs)
    key_value
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all key_values", %{conn: conn} do
      conn = get(conn, api_v1_key_value_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create key_value" do
    test "renders key_value when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_key_value_path(conn, :create), key_value: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_key_value_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               # "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "key" => "some key",
               "key_group" => "some key_group",
               "key_subgroup" => "some key_subgroup",
               "locale" => "some locale",
               "position" => 42,
               "set" => "some set",
               "value" => "some value"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_key_value_path(conn, :create), key_value: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update key_value" do
    setup [:create_key_value]

    test "renders key_value when data is valid", %{
      conn: conn,
      key_value: %KeyValue{id: id} = key_value
    } do
      conn = put(conn, api_v1_key_value_path(conn, :update, key_value), key_value: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_key_value_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               # "id" => id,
               # "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "key" => "some updated key",
               "key_group" => "some updated key_group",
               "key_subgroup" => "some updated key_subgroup",
               "locale" => "some updated locale",
               "position" => 43,
               "set" => "some updated set",
               "value" => "some updated value"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, key_value: key_value} do
      conn = put(conn, api_v1_key_value_path(conn, :update, key_value), key_value: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete key_value" do
    setup [:create_key_value]

    test "deletes chosen key_value", %{conn: conn, key_value: key_value} do
      conn = delete(conn, api_v1_key_value_path(conn, :delete, key_value))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_key_value_path(conn, :show, key_value))
      end)
    end
  end

  defp create_key_value(_) do
    key_value = fixture(:key_value)
    {:ok, key_value: key_value}
  end
end
