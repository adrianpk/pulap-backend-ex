defmodule PulapWeb.TenureController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.Tenure

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    tenures = Biz.list_tenures()
    render(conn, "index.json", tenures: tenures)
  end

  def create(conn, %{"tenure" => tenure_params}) do
    with {:ok, %Tenure{} = tenure} <- Biz.create_tenure(tenure_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", tenure_path(conn, :show, tenure))
      |> render("show.json", tenure: tenure)
    end
  end

  def show(conn, %{"id" => id}) do
    tenure = Biz.get_tenure!(id)
    render(conn, "show.json", tenure: tenure)
  end

  def update(conn, %{"id" => id, "tenure" => tenure_params}) do
    tenure = Biz.get_tenure!(id)

    with {:ok, %Tenure{} = tenure} <- Biz.update_tenure(tenure, tenure_params) do
      render(conn, "show.json", tenure: tenure)
    end
  end

  def delete(conn, %{"id" => id}) do
    tenure = Biz.get_tenure!(id)
    with {:ok, %Tenure{}} <- Biz.delete_tenure(tenure) do
      send_resp(conn, :no_content, "")
    end
  end
end
