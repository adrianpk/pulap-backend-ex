defmodule PulapWeb.CurrencyControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz
  alias Pulap.Biz.Currency

  @create_attrs %{
    code: "some code",
    icon: "some icon",
    id: "7488a646-e31f-11e4-aace-600308960662",
    is_active: true,
    is_logical_deleted: true,
    minor_unit: "some minor_unit",
    name: "some name",
    num_code: "some num_code"
  }
  @update_attrs %{
    code: "some updated code",
    icon: "some updated icon",
    id: "7488a646-e31f-11e4-aace-600308960668",
    is_active: false,
    is_logical_deleted: false,
    minor_unit: "some updated minor_unit",
    name: "some updated name",
    num_code: "some updated num_code"
  }
  @invalid_attrs %{
    code: nil,
    icon: nil,
    id: nil,
    is_active: nil,
    is_logical_deleted: nil,
    minor_unit: nil,
    name: nil,
    num_code: nil
  }

  def fixture(:currency) do
    {:ok, currency} = Biz.create_currency(@create_attrs)
    currency
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all currencies", %{conn: conn} do
      conn = get(conn, api_v1_currency_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create currency" do
    test "renders currency when data is valid", %{conn: conn} do
      conn = post(conn, api_v1_currency_path(conn, :create), currency: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, api_v1_currency_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "code" => "some code",
               "icon" => "some icon",
               # "id" => "7488a646-e31f-11e4-aace-600308960662",
               "is_active" => true,
               "is_logical_deleted" => true,
               "minor_unit" => "some minor_unit",
               "name" => "some name",
               "num_code" => "some num_code"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, api_v1_currency_path(conn, :create), currency: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update currency" do
    setup [:create_currency]

    test "renders currency when data is valid", %{
      conn: conn,
      currency: %Currency{id: id} = currency
    } do
      conn = put(conn, api_v1_currency_path(conn, :update, currency), currency: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, api_v1_currency_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               # "id" => id,
               "code" => "some updated code",
               "icon" => "some updated icon",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "is_active" => false,
               "is_logical_deleted" => false,
               "minor_unit" => "some updated minor_unit",
               "name" => "some updated name",
               "num_code" => "some updated num_code"
             }
    end

    test "renders errors when data is invalid", %{conn: conn, currency: currency} do
      conn = put(conn, api_v1_currency_path(conn, :update, currency), currency: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete currency" do
    setup [:create_currency]

    test "deletes chosen currency", %{conn: conn, currency: currency} do
      conn = delete(conn, api_v1_currency_path(conn, :delete, currency))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, api_v1_currency_path(conn, :show, currency))
      end)
    end
  end

  defp create_currency(_) do
    currency = fixture(:currency)
    {:ok, currency: currency}
  end
end
