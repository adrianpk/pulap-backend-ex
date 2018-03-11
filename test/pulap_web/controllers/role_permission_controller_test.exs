defmodule PulapWeb.RolePermissionControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.RolePermission

  @create_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organization_name: "some organization_name", tag: "some tag"}
  @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organization_name: "some updated organization_name", tag: "some updated tag"}
  @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organization_name: nil, tag: nil}

  def fixture(:role_permission) do
    {:ok, role_permission} = Auth.create_role_permission(@create_attrs)
    role_permission
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all role_permissions", %{conn: conn} do
      conn = get conn, api_v1_role_permission_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create role_permission" do
    test "renders role_permission when data is valid", %{conn: conn} do
      conn = post conn, api_v1_role_permission_path(conn, :create), role_permission: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_v1_role_permission_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => true,
        "name" => "some name",
        "organization_name" => "some organization_name",
        "tag" => "some tag"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_v1_role_permission_path(conn, :create), role_permission: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update role_permission" do
    setup [:create_role_permission]

    test "renders role_permission when data is valid", %{conn: conn, role_permission: %RolePermission{id: id} = role_permission} do
      conn = put conn, api_v1_role_permission_path(conn, :update, role_permission), role_permission: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_v1_role_permission_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => false,
        "name" => "some updated name",
        "organization_name" => "some updated organization_name",
        "tag" => "some updated tag"}
    end

    test "renders errors when data is invalid", %{conn: conn, role_permission: role_permission} do
      conn = put conn, api_v1_role_permission_path(conn, :update, role_permission), role_permission: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete role_permission" do
    setup [:create_role_permission]

    test "deletes chosen role_permission", %{conn: conn, role_permission: role_permission} do
      conn = delete conn, api_v1_role_permission_path(conn, :delete, role_permission)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_v1_role_permission_path(conn, :show, role_permission)
      end
    end
  end

  defp create_role_permission(_) do
    role_permission = fixture(:role_permission)
    {:ok, role_permission: role_permission}
  end
end
