defmodule PulapWeb.ResourcePermissionController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.ResourcePermission

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    resource_permissions = Auth.list_resource_permissions()
    render(conn, "index.json", resource_permissions: resource_permissions)
  end

  def create(conn, %{"resource_permission" => resource_permission_params}) do
    with {:ok, %ResourcePermission{} = resource_permission} <- Auth.create_resource_permission(resource_permission_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", resource_permission_path(conn, :show, resource_permission))
      |> render("show.json", resource_permission: resource_permission)
    end
  end

  def show(conn, %{"id" => id}) do
    resource_permission = Auth.get_resource_permission!(id)
    render(conn, "show.json", resource_permission: resource_permission)
  end

  def update(conn, %{"id" => id, "resource_permission" => resource_permission_params}) do
    resource_permission = Auth.get_resource_permission!(id)

    with {:ok, %ResourcePermission{} = resource_permission} <- Auth.update_resource_permission(resource_permission, resource_permission_params) do
      render(conn, "show.json", resource_permission: resource_permission)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource_permission = Auth.get_resource_permission!(id)
    with {:ok, %ResourcePermission{}} <- Auth.delete_resource_permission(resource_permission) do
      send_resp(conn, :no_content, "")
    end
  end
end
