defmodule PulapWeb.ResourceController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Resource

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    resources = Auth.list_resources()
    render(conn, "index.json", resources: resources)
  end

  def create(conn, %{"resource" => resource_params}) do
    with {:ok, %Resource{} = resource} <- Auth.create_resource(resource_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", resource_path(conn, :show, resource))
      |> render("show.json", resource: resource)
    end
  end

  def show(conn, %{"id" => id}) do
    resource = Auth.get_resource!(id)
    render(conn, "show.json", resource: resource)
  end

  def update(conn, %{"id" => id, "resource" => resource_params}) do
    resource = Auth.get_resource!(id)

    with {:ok, %Resource{} = resource} <- Auth.update_resource(resource, resource_params) do
      render(conn, "show.json", resource: resource)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource = Auth.get_resource!(id)
    with {:ok, %Resource{}} <- Auth.delete_resource(resource) do
      send_resp(conn, :no_content, "")
    end
  end
end
