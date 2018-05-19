defmodule PulapWeb.ResourceControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.Resource

  @create_attrs %{
    description: "some description",
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    name: "some name",
    organization_name: "some organization_name",
    tag: "some tag"
  }
  @update_attrs %{
    description: "some updated description",
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    name: "some updated name",
    organization_name: "some updated organization_name",
    tag: "some updated tag"
  }
  @invalid_attrs %{
    description: nil,
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    name: nil,
    organization_name: nil,
    tag: nil
  }

  def fixture(:resource) do
    {:ok, resource} = Auth.create_resource(@create_attrs)
    resource
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all resources", %{conn: conn} do
      conn = get(conn, api_v1_resource_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create resource" do
    test "renders resource when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_resource_path(conn, :create), resource: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_resource_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "description" => "some description",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "name" => "some name",
               "organization_name" => "some organization_name",
               "tag" => "some tag"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_resource_path(conn, :create), resource: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update resource" do
    setup [:create_resource]

    test "renders resource when data is valid", %{
      conn: conn,
      resource: %Resource{id: id} = resource
    } do
      conn = put(conn, api_v1_resource_path(conn, :update, resource), resource: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_resource_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "description" => "some updated description",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "name" => "some updated name",
               "organization_name" => "some updated organization_name",
               "tag" => "some updated tag"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, resource: resource} do
      conn = put(conn, api_v1_resource_path(conn, :update, resource), resource: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete resource" do
    setup [:create_resource]

    test "deletes chosen resource", %{conn: conn, resource: resource} do
      conn = delete(conn, api_v1_resource_path(conn, :delete, resource))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_resource_path(conn, :show, resource))
      end)
    end
  end

  defp create_resource(_) do
    resource = fixture(:resource)
    {:ok, resource: resource}
  end
end
