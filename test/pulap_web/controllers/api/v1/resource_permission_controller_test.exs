defmodule PulapWeb.ResourcePermissionControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.ResourcePermission

  @create_attrs %{"": "some ", description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organization_name: "some organization_name", tag: "some tag"}
  @update_attrs %{"": "some updated ", description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organization_name: "some updated organization_name", tag: "some updated tag"}
  @invalid_attrs %{"": nil, description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organization_name: nil, tag: nil}

  def fixture(:resource_permission) do
    {:ok, resource_permission} = Auth.create_resource_permission(@create_attrs)
    resource_permission
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all resource_permissions", %{conn: conn} do
      conn = get conn, api_v1_resource_permission_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create resource_permission" do
    test "renders resource_permission when data is valid", %{conn: conn} do
      conn = post conn, api_v1_resource_permission_path(conn, :create), resource_permission: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_v1_resource_permission_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "" => "some ",
        "description" => "some description",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => true,
        "name" => "some name",
        "organization_name" => "some organization_name",
        "tag" => "some tag"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_v1_resource_permission_path(conn, :create), resource_permission: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update resource_permission" do
    setup [:create_resource_permission]

    test "renders resource_permission when data is valid", %{conn: conn, resource_permission: %ResourcePermission{id: id} = resource_permission} do
      conn = put conn, api_v1_resource_permission_path(conn, :update, resource_permission), resource_permission: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_v1_resource_permission_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "" => "some updated ",
        "description" => "some updated description",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => false,
        "name" => "some updated name",
        "organization_name" => "some updated organization_name",
        "tag" => "some updated tag"}
    end

    test "renders errors when data is invalid", %{conn: conn, resource_permission: resource_permission} do
      conn = put conn, api_v1_resource_permission_path(conn, :update, resource_permission), resource_permission: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete resource_permission" do
    setup [:create_resource_permission]

    test "deletes chosen resource_permission", %{conn: conn, resource_permission: resource_permission} do
      conn = delete conn, api_v1_resource_permission_path(conn, :delete, resource_permission)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_v1_resource_permission_path(conn, :show, resource_permission)
      end
    end
  end

  defp create_resource_permission(_) do
    resource_permission = fixture(:resource_permission)
    {:ok, resource_permission: resource_permission}
  end
end
