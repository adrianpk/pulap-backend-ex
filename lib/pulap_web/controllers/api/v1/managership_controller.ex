defmodule PulapWeb.API.V1.ManagershipController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.Managership

  action_fallback PulapWeb.API.FallbackController

  def index(conn, _params) do
    managership = Biz.list_managership()
    render(conn, "index.json", managership: managership)
  end

  def create(conn, %{"managership" => managership_params}) do
    with {:ok, %Managership{} = managership} <- Biz.create_managership(managership_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_managership_path(conn, :show, managership))
      |> render("show.json", managership: managership)
    end
  end

  def show(conn, %{"id" => id}) do
    managership = Biz.get_managership!(id)
    render(conn, "show.json", managership: managership)
  end

  def update(conn, %{"id" => id, "managership" => managership_params}) do
    managership = Biz.get_managership!(id)

    with {:ok, %Managership{} = managership} <- Biz.update_managership(managership, managership_params) do
      render(conn, "show.json", managership: managership)
    end
  end

  def delete(conn, %{"id" => id}) do
    managership = Biz.get_managership!(id)
    with {:ok, %Managership{}} <- Biz.delete_managership(managership) do
      send_resp(conn, :no_content, "")
    end
  end
end
