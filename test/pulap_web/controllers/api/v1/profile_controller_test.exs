defmodule PulapWeb.ProfileControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  alias Pulap.Auth.Profile

  # @user_create_attrs %{annotations: "some annotations", card: "some card", email: "some email", family_name: "some family_name", geolocation: 42, given_name: "some given_name", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, middle_names: "some middle_names", password_hash: "some password_hash", started_at: "2010-04-17 14:00:00.000000Z", username: "some username"}
  @create_attrs %{
    anniversary_date: "some anniversary_date",
    annotations: "some annotations",
    avatar: "some avatar",
    avatar_path: "some avatar_path",
    bio: "some bio",
    cards: "some cards",
    description: "some description",
    email: "some email",
    geolocation: 42,
    header: "some header",
    header_path: "some header_path",
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    moto: "some moto",
    name: "some name",
    property_set_name: "some property_set_name",
    website: "some website",
    user_id: "7488a646-e31f-11e4-aace-600308960662"
  }
  @update_attrs %{
    anniversary_date: "some updated anniversary_date",
    annotations: "some updated annotations",
    avatar: "some updated avatar",
    avatar_path: "some updated avatar_path",
    bio: "some updated bio",
    cards: "some updated cards",
    description: "some updated description",
    email: "some updated email",
    geolocation: 43,
    header: "some updated header",
    header_path: "some updated header_path",
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    moto: "some updated moto",
    name: "some updated name",
    property_set_name: "some updated property_set_name",
    website: "some updated website"
  }
  @invalid_attrs %{
    anniversary_date: nil,
    annotations: nil,
    avatar: nil,
    avatar_path: nil,
    bio: nil,
    cards: nil,
    description: nil,
    email: nil,
    geolocation: nil,
    header: nil,
    header_path: nil,
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    moto: nil,
    name: nil,
    property_set_name: nil,
    website: nil
  }

  def fixture(:profile) do
    {:ok, profile} = Auth.create_profile(@create_attrs)
    profile
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all profiles", %{conn: conn} do
      conn =
        get(conn, api_v1_user_profile_path(conn, "7488a646-e31f-11e4-aace-600308960662", :index))

      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create profile" do
    test "renders profile when data is valid", %{conn: conn} do
      conn =
        post(
          conn,
          api_v1_user_profile_path(conn, "7488a646-e31f-11e4-aace-600308960662", :create),
          profile: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn =
        get(
          conn,
          api_v1_user_profile_path(conn, "7488a646-e31f-11e4-aace-600308960662", :show, id)
        )

      assert json_response(conn, 200)["data"] == %{
               # "id" => id,
               "anniversary_date" => "some anniversary_date",
               "annotations" => "some annotations",
               "avatar" => "some avatar",
               "avatar_path" => "some avatar_path",
               "bio" => "some bio",
               "cards" => "some cards",
               "description" => "some description",
               "email" => "some email",
               "geolocation" => 42,
               "header" => "some header",
               "header_path" => "some header_path",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "moto" => "some moto",
               "name" => "some name",
               "property_set_name" => "some property_set_name",
               "website" => "some website"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(
          conn,
          api_v1_user_profile_path(conn, "7488a646-e31f-11e4-aace-600308960662", :create),
          profile: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update profile" do
    setup [:create_profile]

    test "renders profile when data is valid", %{conn: conn, profile: %Profile{id: id} = profile} do
      conn =
        put(
          conn,
          api_v1_user_profile_path(
            conn,
            :update,
            "7488a646-e31f-11e4-aace-600308960662",
            profile
          ),
          profile: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn =
        get(
          conn,
          api_v1_user_profile_path(conn, :show, "7488a646-e31f-11e4-aace-600308960662", id)
        )

      assert json_response(conn, 200)["data"] == %{
               # "id" => id,
               "anniversary_date" => "some updated anniversary_date",
               "annotations" => "some updated annotations",
               "avatar" => "some updated avatar",
               "avatar_path" => "some updated avatar_path",
               "bio" => "some updated bio",
               "cards" => "some updated cards",
               "description" => "some updated description",
               "email" => "some updated email",
               "geolocation" => 43,
               "header" => "some updated header",
               "header_path" => "some updated header_path",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "moto" => "some updated moto",
               "name" => "some updated name",
               "property_set_name" => "some updated property_set_name",
               "website" => "some updated website"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, profile: profile} do
      conn =
        put(
          conn,
          api_v1_user_profile_path(
            conn,
            :update,
            "7488a646-e31f-11e4-aace-600308960662",
            profile
          ),
          profile: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete profile" do
    setup [:create_profile]

    test "deletes chosen profile", %{conn: conn, profile: profile} do
      conn =
        delete(
          conn,
          api_v1_user_profile_path(conn, :delete, "7488a646-e31f-11e4-aace-600308960662", profile)
        )

      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(
          conn,
          api_v1_user_profile_path(conn, :show, "7488a646-e31f-11e4-aace-600308960662", profile)
        )
      end)
    end
  end

  defp create_profile(_) do
    profile = fixture(:profile)
    {:ok, profile: profile}
  end
end
