defmodule PulapWeb.API.V1.RealEstateController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.RealEstate

  action_fallback PulapWeb.API.FallbackController

  def index(conn, _params) do
    real_estate = Biz.list_real_estate()
    render(conn, "index.json", real_estate: real_estate)
  end

  require Logger
  def create(conn, %{"real_estate" => real_estate_params}) do
    with {:ok, %RealEstate{} = real_estate} <- Biz.create_real_estate(real_estate_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_real_estate_path(conn, :show, real_estate))
      |> render("show.json", real_estate: real_estate)
    end
  end

  def show(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    render(conn, "show.json", real_estate: real_estate)
  end

  def update(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = Biz.get_real_estate!(id)

    with {:ok, %RealEstate{} = real_estate} <- Biz.update_real_estate(real_estate, real_estate_params) do
      render(conn, "show.json", real_estate: real_estate)
    end
  end

  def delete(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    with {:ok, %RealEstate{}} <- Biz.delete_real_estate(real_estate) do
      send_resp(conn, :no_content, "")
    end
  end
end
