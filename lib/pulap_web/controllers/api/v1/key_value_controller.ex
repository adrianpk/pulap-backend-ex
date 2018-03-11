defmodule PulapWeb.API.V1.KeyValueController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.App.KeyValue

  action_fallback PulapWeb.API.FallbackController

  def index(conn, _params) do
    key_values = App.list_key_values()
    render(conn, "index.json", key_values: key_values)
  end

  def create(conn, %{"key_value" => key_value_params}) do
    with {:ok, %KeyValue{} = key_value} <- App.create_key_value(key_value_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_key_value_path(conn, :show, key_value))
      |> render("show.json", key_value: key_value)
    end
  end

  def show(conn, %{"id" => id}) do
    key_value = App.get_key_value!(id)
    render(conn, "show.json", key_value: key_value)
  end

  def update(conn, %{"id" => id, "key_value" => key_value_params}) do
    key_value = App.get_key_value!(id)

    with {:ok, %KeyValue{} = key_value} <- App.update_key_value(key_value, key_value_params) do
      render(conn, "show.json", key_value: key_value)
    end
  end

  def delete(conn, %{"id" => id}) do
    key_value = App.get_key_value!(id)
    with {:ok, %KeyValue{}} <- App.delete_key_value(key_value) do
      send_resp(conn, :no_content, "")
    end
  end
end
