defmodule PulapWeb.PermissionControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.Permission

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

  def fixture(:permission) do
    {:ok, permission} = Auth.create_permission(@create_attrs)
    permission
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all permissions", %{conn: conn} do
      conn = get(conn, api_v1_permission_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create permission" do
    test "renders permission when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_permission_path(conn, :create), permission: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_permission_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               # "id" => id,
               "description" => "some description",
               # "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "name" => "some name",
               "organization_name" => "some organization_name"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_permission_path(conn, :create), permission: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update permission" do
    setup [:create_permission]

    test "renders permission when data is valid", %{
      conn: conn,
      permission: %Permission{id: id} = permission
    } do
      conn =
        put(conn, api_v1_permission_path(conn, :update, permission), permission: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_permission_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               # "id" => id,
               "description" => "some updated description",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "name" => "some updated name",
               "organization_name" => "some updated organization_name"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, permission: permission} do
      conn =
        put(conn, api_v1_permission_path(conn, :update, permission), permission: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete permission" do
    setup [:create_permission]

    test "deletes chosen permission", %{conn: conn, permission: permission} do
      conn = delete(conn, api_v1_permission_path(conn, :delete, permission))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_permission_path(conn, :show, permission))
      end)
    end
  end

  defp create_permission(_) do
    permission = fixture(:permission)
    {:ok, permission: permission}
  end
end
