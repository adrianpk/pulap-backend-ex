defmodule PulapWeb.OrganizationControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.Organization

  @create_attrs %{annotations: "some annotations", card: "some card", default: "some default", description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organizations: 42, owner_username: "some owner_username", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{annotations: "some updated annotations", card: "some updated card", default: "some updated default", description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organizations: 43, owner_username: "some updated owner_username", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{annotations: nil, card: nil, default: nil, description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organizations: nil, owner_username: nil, started_at: nil}

  def fixture(:organization) do
    {:ok, organization} = Auth.create_organization(@create_attrs)
    organization
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all organizations", %{conn: conn} do
      conn = get conn, api_v1_organization_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create organization" do
    test "renders organization when data is valid", %{conn: conn} do
      conn = post conn, api_v1_organization_path(conn, :create), organization: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_v1_organization_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        # "id" => id,
        "annotations" => "some annotations",
        "card" => "some card",
        "default" => "some default",
        "description" => "some description",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => true,
        "name" => "some name",
        "organizations" => 42,
        "owner_username" => "some owner_username",
        "started_at" => "2010-04-17 14:00:00.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_v1_organization_path(conn, :create), organization: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update organization" do
    setup [:create_organization]

    test "renders organization when data is valid", %{conn: conn, organization: %Organization{id: id} = organization} do
      conn = put conn, api_v1_organization_path(conn, :update, organization), organization: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_v1_organization_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        # "id" => id,
        "annotations" => "some updated annotations",
        "card" => "some updated card",
        "default" => "some updated default",
        "description" => "some updated description",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => false,
        "name" => "some updated name",
        "organizations" => 43,
        "owner_username" => "some updated owner_username",
        "started_at" => "2011-05-18 15:01:01.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn, organization: organization} do
      conn = put conn, api_v1_organization_path(conn, :update, organization), organization: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete organization" do
    setup [:create_organization]

    test "deletes chosen organization", %{conn: conn, organization: organization} do
      conn = delete conn, api_v1_organization_path(conn, :delete, organization)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_v1_organization_path(conn, :show, organization)
      end
    end
  end

  defp create_organization(_) do
    organization = fixture(:organization)
    {:ok, organization: organization}
  end
end
