defmodule PulapWeb.CurrencyController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.Currency

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    currencies = Biz.list_currencies()
    render(conn, "index.json", currencies: currencies)
  end

  def create(conn, %{"currency" => currency_params}) do
    with {:ok, %Currency{} = currency} <- Biz.create_currency(currency_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", currency_path(conn, :show, currency))
      |> render("show.json", currency: currency)
    end
  end

  def show(conn, %{"id" => id}) do
    currency = Biz.get_currency!(id)
    render(conn, "show.json", currency: currency)
  end

  def update(conn, %{"id" => id, "currency" => currency_params}) do
    currency = Biz.get_currency!(id)

    with {:ok, %Currency{} = currency} <- Biz.update_currency(currency, currency_params) do
      render(conn, "show.json", currency: currency)
    end
  end

  def delete(conn, %{"id" => id}) do
    currency = Biz.get_currency!(id)
    with {:ok, %Currency{}} <- Biz.delete_currency(currency) do
      send_resp(conn, :no_content, "")
    end
  end
end
