defmodule PulapWeb.API.V1.PropertyController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.App.Property

  action_fallback(PulapWeb.API.FallbackController)

  def index(conn, _params) do
    properties = App.list_properties()
    render(conn, "index.json", properties: properties)
  end

  def create(conn, %{"property" => property_params}) do
    with {:ok, %Property{} = property} <- App.create_property(property_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_property_path(conn, :show, property))
      |> render("show.json", property: property)
    end
  end

  def show(conn, %{"id" => id}) do
    property = App.get_property!(id)
    render(conn, "show.json", property: property)
  end

  def update(conn, %{"id" => id, "property" => property_params}) do
    property = App.get_property!(id)

    with {:ok, %Property{} = property} <- App.update_property(property, property_params) do
      render(conn, "show.json", property: property)
    end
  end

  def delete(conn, %{"id" => id}) do
    property = App.get_property!(id)

    with {:ok, %Property{}} <- App.delete_property(property) do
      send_resp(conn, :no_content, "")
    end
  end
end
