defmodule PulapWeb.API.V1.RealEstateController do
  use PulapWeb, :controller

  # alias Pulap.Biz
  alias Pulap.Biz.RealEstate.Context, as: RealEstateContext
  alias Pulap.Biz.RealEstate

  action_fallback(PulapWeb.API.FallbackController)

  def index(conn, _params) do
    real_estate = RealEstateContext.list()
    render(conn, "index.json", real_estate: real_estate)
  end

  require Logger

  def create(conn, %{"real_estate" => real_estate_params}) do
    with {:ok, %RealEstate{} = real_estate} <- RealEstateContext.create(real_estate_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_real_estate_path(conn, :show, real_estate))
      |> render("show.json", real_estate: real_estate)
    end
  end

  def show(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    render(conn, "show.json", real_estate: real_estate)
  end

  def update(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    with {:ok, %RealEstate{} = real_estate} <-
           RealEstateContext.update(real_estate, real_estate_params) do
      render(conn, "show.json", real_estate: real_estate)
    end
  end

  def delete(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)

    with {:ok, %RealEstate{}} <- RealEstateContext.delete(real_estate) do
      send_resp(conn, :no_content, "")
    end
  end
end
