defmodule PulapWeb.API.V1.AdministratorshipController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.Administratorship

  action_fallback PulapWeb.API.FallbackController

  def index(conn, _params) do
    administratorship = Biz.list_administratorship()
    render(conn, "index.json", administratorship: administratorship)
  end

  def create(conn, %{"administratorship" => administratorship_params}) do
    with {:ok, %Administratorship{} = administratorship} <- Biz.create_administratorship(administratorship_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_administratorship_path(conn, :show, administratorship))
      |> render("show.json", administratorship: administratorship)
    end
  end

  def show(conn, %{"id" => id}) do
    administratorship = Biz.get_administratorship!(id)
    render(conn, "show.json", administratorship: administratorship)
  end

  def update(conn, %{"id" => id, "administratorship" => administratorship_params}) do
    administratorship = Biz.get_administratorship!(id)

    with {:ok, %Administratorship{} = administratorship} <- Biz.update_administratorship(administratorship, administratorship_params) do
      render(conn, "show.json", administratorship: administratorship)
    end
  end

  def delete(conn, %{"id" => id}) do
    administratorship = Biz.get_administratorship!(id)
    with {:ok, %Administratorship{}} <- Biz.delete_administratorship(administratorship) do
      send_resp(conn, :no_content, "")
    end
  end
end
