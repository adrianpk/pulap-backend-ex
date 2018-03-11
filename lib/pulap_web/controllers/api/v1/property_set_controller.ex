defmodule PulapWeb.API.V1.PropertySetController do
  use PulapWeb, :controller

  alias Pulap.App
  alias Pulap.App.PropertySet

  action_fallback PulapWeb.API.FallbackController

  def index(conn, _params) do
    property_sets = App.list_property_sets()
    render(conn, "index.json", property_sets: property_sets)
  end

  def create(conn, %{"property_set" => property_set_params}) do
    with {:ok, %PropertySet{} = property_set} <- App.create_property_set(property_set_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_property_set_path(conn, :show, property_set))
      |> render("show.json", property_set: property_set)
    end
  end

  def show(conn, %{"id" => id}) do
    property_set = App.get_property_set!(id)
    render(conn, "show.json", property_set: property_set)
  end

  def update(conn, %{"id" => id, "property_set" => property_set_params}) do
    property_set = App.get_property_set!(id)

    with {:ok, %PropertySet{} = property_set} <- App.update_property_set(property_set, property_set_params) do
      render(conn, "show.json", property_set: property_set)
    end
  end

  def delete(conn, %{"id" => id}) do
    property_set = App.get_property_set!(id)
    with {:ok, %PropertySet{}} <- App.delete_property_set(property_set) do
      send_resp(conn, :no_content, "")
    end
  end
end
