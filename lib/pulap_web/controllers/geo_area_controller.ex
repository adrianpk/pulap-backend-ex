defmodule PulapWeb.GeoAreaController do
  use PulapWeb, :controller

  alias Pulap.Geo
  alias Pulap.Geo.GeoArea

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    geo_areas = Geo.list_geo_areas()
    render(conn, "index.json", geo_areas: geo_areas)
  end

  def create(conn, %{"geo_area" => geo_area_params}) do
    with {:ok, %GeoArea{} = geo_area} <- Geo.create_geo_area(geo_area_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", geo_area_path(conn, :show, geo_area))
      |> render("show.json", geo_area: geo_area)
    end
  end

  def show(conn, %{"id" => id}) do
    geo_area = Geo.get_geo_area!(id)
    render(conn, "show.json", geo_area: geo_area)
  end

  def update(conn, %{"id" => id, "geo_area" => geo_area_params}) do
    geo_area = Geo.get_geo_area!(id)

    with {:ok, %GeoArea{} = geo_area} <- Geo.update_geo_area(geo_area, geo_area_params) do
      render(conn, "show.json", geo_area: geo_area)
    end
  end

  def delete(conn, %{"id" => id}) do
    geo_area = Geo.get_geo_area!(id)
    with {:ok, %GeoArea{}} <- Geo.delete_geo_area(geo_area) do
      send_resp(conn, :no_content, "")
    end
  end
end
