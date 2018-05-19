defmodule PulapWeb.UserControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.User

  @create_attrs %{
    annotations: "some annotations",
    card: "some card",
    email: "some email",
    family_name: "some family_name",
    geolocation: 42,
    given_name: "some given_name",
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    middle_names: "some middle_names",
    password_hash: "some password_hash",
    started_at: "2010-04-17 14:00:00.000000Z",
    username: "some username"
  }
  @update_attrs %{
    annotations: "some updated annotations",
    card: "some updated card",
    email: "some updated email",
    family_name: "some updated family_name",
    geolocation: 43,
    given_name: "some updated given_name",
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    middle_names: "some updated middle_names",
    password_hash: "some updated password_hash",
    started_at: "2011-05-18 15:01:01.000000Z",
    username: "some updated username"
  }
  @invalid_attrs %{
    annotations: nil,
    card: nil,
    email: nil,
    family_name: nil,
    geolocation: nil,
    given_name: nil,
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    middle_names: nil,
    password_hash: nil,
    started_at: nil,
    username: nil
  }

  def fixture(:user) do
    {:ok, user} = Auth.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, api_v1_user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_user_path(conn, :create), user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_user_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "annotations" => "some annotations",
               "card" => "some card",
               "email" => "some email",
               "family_name" => "some family_name",
               "geolocation" => 42,
               "given_name" => "some given_name",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "middle_names" => "some middle_names",
               "password_hash" => "some password_hash",
               "started_at" => "2010-04-17 14:00:00.000000Z",
               "username" => "some username"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, api_v1_user_path(conn, :update, user), user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_user_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "annotations" => "some updated annotations",
               "card" => "some updated card",
               "email" => "some updated email",
               "family_name" => "some updated family_name",
               "geolocation" => 43,
               "given_name" => "some updated given_name",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "middle_names" => "some updated middle_names",
               "password_hash" => "some updated password_hash",
               "started_at" => "2011-05-18 15:01:01.000000Z",
               "username" => "some updated username"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, api_v1_user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, api_v1_user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_user_path(conn, :show, user))
      end)
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
