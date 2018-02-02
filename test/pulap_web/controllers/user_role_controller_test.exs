defmodule PulapWeb.UserRoleControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.UserRole

  @create_attrs %{description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organization_name: "some organization_name"}
  @update_attrs %{description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organization_name: "some updated organization_name"}
  @invalid_attrs %{description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organization_name: nil}

  def fixture(:user_role) do
    {:ok, user_role} = Auth.create_user_role(@create_attrs)
    user_role
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_roles", %{conn: conn} do
      conn = get conn, user_role_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_role" do
    test "renders user_role when data is valid", %{conn: conn} do
      conn = post conn, user_role_path(conn, :create), user_role: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, user_role_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => true,
        "name" => "some name",
        "organization_name" => "some organization_name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_role_path(conn, :create), user_role: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_role" do
    setup [:create_user_role]

    test "renders user_role when data is valid", %{conn: conn, user_role: %UserRole{id: id} = user_role} do
      conn = put conn, user_role_path(conn, :update, user_role), user_role: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, user_role_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => false,
        "name" => "some updated name",
        "organization_name" => "some updated organization_name"}
    end

    test "renders errors when data is invalid", %{conn: conn, user_role: user_role} do
      conn = put conn, user_role_path(conn, :update, user_role), user_role: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_role" do
    setup [:create_user_role]

    test "deletes chosen user_role", %{conn: conn, user_role: user_role} do
      conn = delete conn, user_role_path(conn, :delete, user_role)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, user_role_path(conn, :show, user_role)
      end
    end
  end

  defp create_user_role(_) do
    user_role = fixture(:user_role)
    {:ok, user_role: user_role}
  end
end
