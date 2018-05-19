defmodule PulapWeb.RoleControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.Role

  @create_attrs %{
    description: "some description",
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    name: "some name",
    organization_name: "some organization_name"
  }
  @update_attrs %{
    description: "some updated description",
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    name: "some updated name",
    organization_name: "some updated organization_name"
  }
  @invalid_attrs %{
    description: nil,
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    name: nil,
    organization_name: nil
  }

  def fixture(:role) do
    {:ok, role} = Auth.create_role(@create_attrs)
    role
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all roles", %{conn: conn} do
      conn = get(conn, api_v1_tenure_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create role" do
    test "renders role when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_tenure_path(conn, :create), role: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_tenure_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "description" => "some description",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "name" => "some name",
               "organization_name" => "some organization_name"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_tenure_path(conn, :create), role: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update role" do
    setup [:create_role]

    test "renders role when data is valid", %{conn: conn, role: %Role{id: id} = role} do
      conn = put(conn, api_v1_tenure_path(conn, :update, role), role: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_tenure_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "description" => "some updated description",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "name" => "some updated name",
               "organization_name" => "some updated organization_name"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, role: role} do
      conn = put(conn, api_v1_tenure_path(conn, :update, role), role: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete role" do
    setup [:create_role]

    test "deletes chosen role", %{conn: conn, role: role} do
      conn = delete(conn, api_v1_tenure_path(conn, :delete, role))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_tenure_path(conn, :show, role))
      end)
    end
  end

  defp create_role(_) do
    role = fixture(:role)
    {:ok, role: role}
  end
end
