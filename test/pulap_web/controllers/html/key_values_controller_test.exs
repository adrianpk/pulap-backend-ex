defmodule PulapWeb.HTML.ManagedRealEstateControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Auth
  # alias Pulap.Auth.User
  alias Pulap.Biz
  # alias Pulap.Biz.RealEstate
  alias Pulap.Biz.RealEstate.Context, as: RealEstateContext
  # alias Pulap.Biz.Managership
  alias PulapWeb.Auth.Helpers, as: AuthHelper
  import PulapWeb.TestHelpers
  require Logger

  # Sample timestamp "2010-04-17 14:00:00.000000Z",

  # Sample test structure

  # test "redirects to edit key value presentation when data is valid", %{conn: conn} do
  #   case sign_in(conn) do
  #     {:ok, conn} ->
  #       # Do the test
  #     {:error, _reason, _conn} ->
  #       flunk("User not logged in")
  #   end
  # end

  @user_create_attrs %{
    username: "owner",
    password: "password",
    email: "owner@gmail.com",
    given_name: "Wojciech",
    middle_names: "P",
    family_name: "Novak"
  }

  @key_value_1_1_attrs %{
    is_active: true,
    is_logical_deleted: boolean,
    key: "Key 1",
    key_group: "Key Group 1",
    key_subgroup: "Key Subgroup 1",
    locale: "en",
    position: 0,
    set: "Set 1",
    value: "Value 1",
    created_by_id: "",
    updated_by_id: ""
  }

  @key_value_1_2_attrs %{
    is_active: true,
    is_logical_deleted: boolean,
    key: "Key 2",
    key_group: "Key Group 1",
    key_subgroup: "Key Subgroup 1",
    locale: "en",
    position: 0,
    set: "Set 1",
    value: "Value 2",
    created_by_id: "",
    updated_by_id: ""
  }

  @key_value_2_1_attrs %{
    is_active: true,
    is_logical_deleted: boolean,
    key: "Key 1",
    key_group: "Key Group 2",
    key_subgroup: "Key Subgroup 1 ",
    locale: "en",
    position: 0,
    set: "Set 2",
    value: "Value 1",
    created_by_id: "",
    updated_by_id: ""
  }

  @key_value_2_2_attrs %{
    is_active: true,
    is_logical_deleted: boolean,
    key: "Key 2",
    key_group: "Key Group 2",
    key_subgroup: "Key Subgroup 2",
    locale: "en",
    position: 0,
    set: "Set 2",
    value: "Value 2",
    created_by_id: "",
    updated_by_id: ""
  }

  @key_value_1_1_invalid_attrs %{
    is_active: nil,
    is_logical_deleted: nil,
    key: nil,
    key_group: nil,
    key_subgroup: nil,
    locale: nil,
    position: nil,
    set: nil,
    value: nil,
    created_by_id: nil,
    updated_by_id: nil
  }

  @key_value_1_1_update_attrs %{
    is_active: true,
    is_logical_deleted: boolean,
    key: "Key 01",
    key_group: "Key Group",
    key_subgroup: "Key Subgroup",
    locale: "en",
    position: 0,
    set: "Set 1",
    value: "Value 1 Updated",
    created_by_id: "",
    updated_by_id: ""
  }

  describe "index" do
    setup [:create_all]

    test "lists all key_values in a set for a locale", %{conn: conn} do
      conn = get(conn, key_value_path(conn, :index))
      response = html_response(conn, 200)
      # Logger.warn(response)
      assert response =~ "Value 1"
      assert response =~ "Value 2"
    end
  end

  describe "new key value" do
    setup [:create_all]

    test "renders new Key Value form", %{conn: conn} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = get(conn, key_value_path(conn, :new))
          response = html_response(conn, 200)
          # Logger.warn(response)
          assert response =~ "New Key Value"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "create key value" do
    setup [:create_user]

    test "redirects to edit key value presentation when data is valid", %{conn: conn} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = post(conn, key_value_path(conn, :create), key_value: @key_value_create_attrs)

          redirection_parameters = redirected_params(conn)
          # Logger.warn(inspect redirection_parameters)
          assert %{id: id} = redirection_parameters
          assert redirected_to(conn) == key_value_path(conn, :edit, id)
          assert flash_messages_contain(conn, "Key value created successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{conn: conn} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = post(conn, key_value_path(conn, :create), key_value: @invalid_key_value_attrs)

          assert html_response(conn, 200) =~ "New Key Value"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "edit key value presentation" do
    setup [:create_all]

    test "renders form for editing chosen key value", %{
      conn: conn,
      user: _user,
      key_value: key_value
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = get(conn, key_value_path(conn, :edit, key_value))
          # Logger.warn(html_response(conn, 200))
          assert html_response(conn, 200) =~ "Edit Key Value"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "update key value presentation" do
    setup [:create_all]

    test "redirects to key value edit presentation when data is valid", %{
      conn: conn,
      user: user,
      key_value: key_value
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              key_value_path(conn, :update, key_value),
              key_value: @update_key_value_attrs
            )

          assert redirected_to(conn) == key_value_path(conn, :edit_presentation, key_value)
          assert flash_messages_contain(conn, "Key value updated successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      user: user,
      key_value: key_value
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              key_value_path(conn, :update, key_value),
              key_value: @invalid_key_value_attrs
            )

          assert html_response(conn, 200) =~ "Edit Key Value"
          assert flash_messages_contain(conn, "Check following errors, please.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "delete key value" do
    setup [:create_all]

    test "deletes chosen user", %{conn: conn, user: user, key_value: key_value} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = delete(conn, key_value_path(conn, :delete, key_value))
          assert redirected_to(conn) == key_value_path(conn, :index)
          assert flash_messages_contain(conn, "Key value deleted successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  def sign_in(conn) do
    conn
    |> AuthHelper.sign_in_with_username_and_password(
      @user_create_attrs[:username],
      @user_create_attrs[:password],
      nil
    )
  end

  def fixture(:key_value) do
    {:ok, user} = Auth.sign_up_user(@user_create_attrs)
    user
  end

  def fixture(:key_value) do
    {:ok, key_value} = RealEstateContext.create(@key_value_create_attrs)
    key_value
  end

  def fixture(:key_value_2) do
    {:ok, key_value_2} = RealEstateContext.create(@key_value_2_create_attrs)
    key_value_2
  end

  def fixture(:all) do
    user = fixture(:user)
    key_value = fixture(:key_value)
    key_value_2 = fixture(:key_value_2)
    {user, key_value, key_value_2}
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end

  defp create_all(_) do
    {user, key_value, key_value_2} = fixture(:all)

    {:ok, user: user, key_value: key_value, key_value_2: key_value_2}
  end

  # defp recycle_conn(conn) do
  #   saved_assigns = conn.assigns
  #   conn = conn |> recycle()
  #   Map.put(conn, :assigns, saved_assigns)
  # end
end
