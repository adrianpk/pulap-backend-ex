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

  # test "redirects to edit real estate presentation when data is valid", %{conn: conn} do
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

  @real_estate_create_attrs %{
    # geolocation: "####",
    accessible_without_stairs: true,
    administrative_area_level_1: "Administrative Level 1",
    administrative_area_level_1_type: "Administrative Level 1 Type",
    administrative_area_level_2: "Administrative Level 2",
    administrative_area_level_2_type: "Administrative Level 2 Type",
    administrative_area_level_3: "Administrative Level 3",
    administrative_area_level_3_type: "Administrative Level 3 Type",
    administrative_area_level_4: "Administrative Level 4",
    administrative_area_level_4_type: "Administrative Level 4 Type",
    administrative_area_level_5: "Administrative Level 5",
    administrative_area_level_5_type: "Administrative Level 5 Type",
    country: "Poland",
    apartment: "A",
    backyard: true,
    balcony: true,
    bathroom_area_m2: 22,
    block: "A",
    currency_code: "USD",
    currency_symbol: "$",
    daily_rent_price: 21_000,
    description: "Description",
    elevator: true,
    floor: "2",
    furniture_set: true,
    geo_area_canonical_name: "####",
    geo_area_canonical_name_loc: "####",
    geo_area_name: "####",
    geo_area_name_loc: "####",
    heating_type_val_en: "Central",
    heating_type_val_loc: "Centralny",
    house_equipment: true,
    house_equipment_description: "House equipment description",
    indoor_area_m2: "220",
    is_active: true,
    is_logical_deleted: false,
    kitchen_type_val_en: "Traditional",
    kitchen_type_val_loc: "Tradycyjny",
    locale: "PL",
    long_term_rent_monthly_price: 230_000,
    name: "Real Estate One",
    number_of_balconies: 2,
    number_of_bathrooms: 2,
    number_of_bedroms: 2,
    number_of_rooms: 5,
    position: 0,
    property_type_val_en: "Traditional",
    property_type_val_loc: "Tradycyjny",
    room_height_cm: "310",
    sale_price: 24_000_000,
    sale_price_per_square_meter: 155_555,
    short_description: "Real estate short description.",
    street: "Florianska",
    street_number: "222",
    suggested_installment_loan: 28_000,
    terrace: true,
    total_area_m2: 500,
    type_of_building_val_en: "Traditional",
    type_of_building_val_loc: "Tradycyjny",
    year_of_construction: "1978"
  }

  @real_estate_update_attrs %{
    apartment: "B",
    administrative_area_level_1: "Administrative Level 1 Updated",
    administrative_area_level_1_type: "Administrative Level 1 Type Updated",
    administrative_area_level_2: "Administrative Level 2 Updated",
    administrative_area_level_2_type: "Administrative Level 2 Type Updated",
    administrative_area_level_3: "Administrative Level 3 Updated",
    administrative_area_level_3_type: "Administrative Level 3 Type Updated",
    administrative_area_level_4: "Administrative Level 4 Updated",
    administrative_area_level_4_type: "Administrative Level 4 Type Updated",
    administrative_area_level_5: "Administrative Level 5 Updated",
    administrative_area_level_5_type: "Administrative Level 5 Type Updated",
    country: "Poland",
    accessible_without_stairs: false,
    backyard: false,
    balcony: false,
    bathroom_area_m2: 44,
    block: "B",
    currency_code: "USD",
    currency_symbol: "$",
    description: "Description updated.",
    elevator: false,
    floor: "4",
    furniture_set: true,
    geo_area_canonical_name: "####",
    geo_area_canonical_name_loc: "####",
    geo_area_name: "####",
    geo_area_name_loc: "####",
    # geolocation: "####",
    heating_type_val_en: "Central",
    heating_type_val_loc: "Centralny",
    house_equipment: true,
    house_equipment_description: "House equipment description",
    indoor_area_m2: "150",
    is_active: true,
    is_logical_deleted: false,
    kitchen_type_val_en: "Traditional",
    kitchen_type_val_loc: "Tradycyjny",
    locale: "PL",
    long_term_rent_monthly_price: 400_000,
    daily_rent_price: 40_000,
    name: "Real Estate One Updated",
    number_of_balconies: 4,
    number_of_bathrooms: 4,
    number_of_bedroms: 4,
    number_of_rooms: 8,
    position: 0,
    sale_price: 40_000_000,
    sale_price_per_square_meter: 322_222,
    property_type_val_en: "Traditional",
    property_type_val_loc: "Tradycyjny",
    room_height_cm: "320",
    short_description: "Short description updated.",
    street: "Świętego",
    street_number: "444",
    suggested_installment_loan: 40_000,
    terrace: false,
    total_area_m2: 1000,
    type_of_building_val_en: "Traditional",
    type_of_building_val_loc: "Tradycyjny",
    year_of_construction: "1970"
  }

  @real_estate_invalid_attrs %{
    apartment: nil,
    administrative_area_level_1: nil,
    administrative_area_level_1_type: nil,
    administrative_area_level_2: nil,
    administrative_area_level_2_type: nil,
    administrative_area_level_3: nil,
    administrative_area_level_3_type: nil,
    administrative_area_level_4: nil,
    administrative_area_level_4_type: nil,
    administrative_area_level_5: nil,
    administrative_area_level_5_type: nil,
    country: nil,
    apartment: nil,
    accessible_without_stairs: nil,
    backyard: nil,
    balcony: nil,
    bathroom_area_m2: nil,
    block: nil,
    currency_code: nil,
    currency_symbol: nil,
    description: nil,
    elevator: nil,
    floor: nil,
    furniture_set: nil,
    geo_area_canonical_name: nil,
    geo_area_canonical_name_loc: nil,
    geo_area_name: nil,
    geo_area_name_loc: nil,
    # geolocation: nil,
    heating_type_val_en: nil,
    heating_type_val_loc: nil,
    house_equipment: nil,
    house_equipment_description: nil,
    indoor_area_m2: nil,
    is_active: nil,
    is_logical_deleted: nil,
    kitchen_type_val_en: nil,
    kitchen_type_val_loc: nil,
    locale: nil,
    long_term_rent_monthly_price: nil,
    daily_rent_price: nil,
    name: nil,
    number_of_balconies: nil,
    number_of_bathrooms: nil,
    number_of_bedroms: nil,
    number_of_rooms: nil,
    position: nil,
    sale_price: nil,
    sale_price_per_square_meter: nil,
    property_type_val_en: nil,
    property_type_val_loc: nil,
    room_height_cm: nil,
    short_description: nil,
    street: nil,
    street_number: nil,
    suggested_installment_loan: nil,
    terrace: nil,
    total_area_m2: nil,
    type_of_building_val_en: nil,
    type_of_building_val_loc: nil,
    year_of_construction: nil
  }

  @real_estate_2_create_attrs %{
    # geolocation: "####",
    accessible_without_stairs: true,
    administrative_area_level_1: "Administrative Level 1",
    administrative_area_level_1_type: "Administrative Level 1 Type",
    administrative_area_level_2: "Administrative Level 2",
    administrative_area_level_2_type: "Administrative Level 2 Type",
    administrative_area_level_3: "Administrative Level 3",
    administrative_area_level_3_type: "Administrative Level 3 Type",
    administrative_area_level_4: "Administrative Level 4",
    administrative_area_level_4_type: "Administrative Level 4 Type",
    administrative_area_level_5: "Administrative Level 5",
    administrative_area_level_5_type: "Administrative Level 5 Type",
    apartment: "A",
    backyard: true,
    balcony: true,
    bathroom_area_m2: 22,
    block: "A",
    currency_code: "USD",
    currency_symbol: "$",
    daily_rent_price: 21_000,
    description: "Description",
    elevator: true,
    floor: "2",
    furniture_set: true,
    geo_area_canonical_name: "####",
    geo_area_canonical_name_loc: "####",
    geo_area_name: "####",
    geo_area_name_loc: "####",
    heating_type_val_en: "Central",
    heating_type_val_loc: "Centralny",
    house_equipment: true,
    house_equipment_description: "House equipment description",
    indoor_area_m2: "220",
    is_active: true,
    is_logical_deleted: false,
    kitchen_type_val_en: "Traditional",
    kitchen_type_val_loc: "Tradycyjny",
    locale: "PL",
    long_term_rent_monthly_price: 230_000,
    name: "Real Estate Two",
    number_of_balconies: 2,
    number_of_bathrooms: 2,
    number_of_bedroms: 2,
    number_of_rooms: 5,
    position: 0,
    property_type_val_en: "Traditional",
    property_type_val_loc: "Tradycyjny",
    room_height_cm: "310",
    sale_price: 24_000_000,
    sale_price_per_square_meter: 155_555,
    short_description: "Real estate short description.",
    street: "Florianska",
    street_number: "222",
    suggested_installment_loan: 28_000,
    terrace: true,
    total_area_m2: 500,
    type_of_building_val_en: "Traditional",
    type_of_building_val_loc: "Tradycyjny",
    year_of_construction: "1978"
  }

  describe "index" do
    setup [:create_all]

    test "lists all user managed real estate", %{conn: conn, user: _user} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = get(conn, real_estate_path(conn, :index))
          response = html_response(conn, 200)
          # Logger.warn(response)
          assert response =~ "Real Estate One"
          assert response =~ "Real Estate Two"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "new real estate" do
    setup [:create_all]

    test "renders new Real Estate form", %{conn: conn} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = get(conn, real_estate_path(conn, :new))
          response = html_response(conn, 200)
          # Logger.warn(response)
          assert response =~ "New Real Estate"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "create real estate" do
    setup [:create_user]

    test "redirects to edit real estate presentation when data is valid", %{conn: conn} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            post(conn, real_estate_path(conn, :create), real_estate: @real_estate_create_attrs)

          redirection_parameters = redirected_params(conn)
          # Logger.warn(inspect redirection_parameters)
          assert %{id: id} = redirection_parameters
          assert redirected_to(conn) == real_estate_path(conn, :edit_address, id)
          assert flash_messages_contain(conn, "Real estate created successfully.")

        ## VERIFY: Connection recycling not working as expected in tests
        ## Trying to reuse the connection for a second request make it lose authentication.
        ## But it also fail if a reauthentication is tryed.
        # conn = conn |> recycle_conn
        # conn = get(conn, real_estate_path(conn, :edit_presentation, id))
        # response = html_response(conn, 302)
        # Logger.warn(inspect response)
        # assert response =~ "Edit Real Estate - Presentation"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{conn: conn} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            post(conn, real_estate_path(conn, :create), real_estate: @real_estate_invalid_attrs)

          assert html_response(conn, 200) =~ "New Real Estate"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "edit real estate presentation" do
    setup [:create_all]

    test "renders form for editing chosen real estate", %{
      conn: conn,
      user: _user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = get(conn, real_estate_path(conn, :edit_presentation, real_estate))
          # Logger.warn(html_response(conn, 200))
          assert html_response(conn, 200) =~ "Edit Real Estate - Presentation"

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "update real estate presentation" do
    setup [:create_all]

    test "redirects to real estate edit presentation when data is valid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_presentation, real_estate),
              real_estate: @real_estate_update_attrs
            )

          assert redirected_to(conn) == real_estate_path(conn, :edit_presentation, real_estate)
          assert flash_messages_contain(conn, "Real estate updated successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_presentation, real_estate),
              real_estate: @real_estate_invalid_attrs
            )

          assert html_response(conn, 200) =~ "Edit Real Estate - Presentation"
          assert flash_messages_contain(conn, "Check following errors, please.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "update real estate address" do
    setup [:create_all]

    test "redirects to real estate edit address when data is valid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_address, real_estate),
              real_estate: @real_estate_update_attrs
            )

          assert redirected_to(conn) == real_estate_path(conn, :edit_address, real_estate)
          assert flash_messages_contain(conn, "Real estate updated successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_address, real_estate),
              real_estate: @real_estate_invalid_attrs
            )

          assert html_response(conn, 200) =~ "Edit Real Estate - Address"
          assert flash_messages_contain(conn, "Check following errors, please.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "update real estate main features" do
    setup [:create_all]

    test "redirects to real estate edit main features when data is valid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_main_features, real_estate),
              real_estate: @real_estate_update_attrs
            )

          assert redirected_to(conn) == real_estate_path(conn, :edit_main_features, real_estate)
          assert flash_messages_contain(conn, "Real estate updated successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_main_features, real_estate),
              real_estate: @real_estate_invalid_attrs
            )

          assert html_response(conn, 200) =~ "Edit Real Estate - Main Features"
          assert flash_messages_contain(conn, "Check following errors, please.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "update real estate services" do
    setup [:create_all]

    test "redirects to real estate edit services when data is valid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_services, real_estate),
              real_estate: @real_estate_update_attrs
            )

          assert redirected_to(conn) == real_estate_path(conn, :edit_services, real_estate)
          assert flash_messages_contain(conn, "Real estate updated successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_services, real_estate),
              real_estate: @real_estate_invalid_attrs
            )

          assert html_response(conn, 200) =~ "Edit Real Estate - Services"
          assert flash_messages_contain(conn, "Check following errors, please.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "update real estate equipment" do
    setup [:create_all]

    test "redirects to real estate edit equipment when data is valid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_services, real_estate),
              real_estate: @real_estate_update_attrs
            )

          assert redirected_to(conn) == real_estate_path(conn, :edit_services, real_estate)
          assert flash_messages_contain(conn, "Real estate updated successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_equipment, real_estate),
              real_estate: @real_estate_invalid_attrs
            )

          assert html_response(conn, 200) =~ "Edit Real Estate - Equipment"
          assert flash_messages_contain(conn, "Check following errors, please.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "update real estate prices" do
    setup [:create_all]

    test "redirects to real estate edit prices when data is valid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_prices, real_estate),
              real_estate: @real_estate_update_attrs
            )

          Logger.warn(inspect(real_estate_path(conn, :edit_prices, real_estate)))
          assert redirected_to(conn) == real_estate_path(conn, :edit_prices, real_estate)
          assert flash_messages_contain(conn, "Real estate updated successfully.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      user: user,
      real_estate: real_estate
    } do
      case sign_in(conn) do
        {:ok, conn} ->
          conn =
            put(
              conn,
              real_estate_path(conn, :update_prices, real_estate),
              real_estate: @real_estate_invalid_attrs
            )

          assert html_response(conn, 200) =~ "Edit Real Estate - Prices"
          assert flash_messages_contain(conn, "Check following errors, please.")

        {:error, _reason, _conn} ->
          flunk("User not logged in")
      end
    end
  end

  describe "delete real estate" do
    setup [:create_all]

    test "deletes chosen user", %{conn: conn, user: user, real_estate: real_estate} do
      case sign_in(conn) do
        {:ok, conn} ->
          conn = delete(conn, real_estate_path(conn, :delete, real_estate))
          assert redirected_to(conn) == real_estate_path(conn, :index)
          assert flash_messages_contain(conn, "Real estate deleted successfully.")

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

  def fixture(:user) do
    {:ok, user} = Auth.sign_up_user(@user_create_attrs)
    user
  end

  def fixture(:real_estate) do
    {:ok, real_estate} = RealEstateContext.create(@real_estate_create_attrs)
    real_estate
  end

  def fixture(:real_estate_2) do
    {:ok, real_estate_2} = RealEstateContext.create(@real_estate_2_create_attrs)
    real_estate_2
  end

  def fixture(:all) do
    user = fixture(:user)
    real_estate = fixture(:real_estate)
    managership_create_attrs = %{user_id: user.id, real_estate_id: real_estate.id}
    managership = Biz.create_managership(managership_create_attrs)
    real_estate_2 = fixture(:real_estate_2)
    managership_create_attrs = %{user_id: user.id, real_estate_id: real_estate_2.id}
    managership_2 = Biz.create_managership(managership_create_attrs)
    {user, real_estate, managership, real_estate_2, managership_2}
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end

  # defp create_real_estate(_) do
  #   real_estate = fixture(:real_estate)
  #   {:ok, real_estate: real_estate}
  # end

  # defp create_managership(_) do
  #   managership = fixture(:managership)
  #   {:ok, managership: managership}
  # end

  defp create_all(_) do
    {user, real_estate, managership, real_estate_2, managership_2} = fixture(:all)

    {:ok,
     user: user,
     real_estate: real_estate,
     managership: managership,
     real_estate_2: real_estate_2,
     managership_2: managership_2}
  end

  # defp recycle_conn(conn) do
  #   saved_assigns = conn.assigns
  #   conn = conn |> recycle()
  #   Map.put(conn, :assigns, saved_assigns)
  # end
end
