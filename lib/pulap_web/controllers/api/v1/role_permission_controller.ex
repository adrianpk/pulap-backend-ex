defmodule PulapWeb.API.V1.RolePermissionController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.RolePermission

  action_fallback(PulapWeb.API.FallbackController)

  def index(conn, _params) do
    role_permissions = Auth.list_role_permissions()
    render(conn, "index.json", role_permissions: role_permissions)
  end

  def create(conn, %{"role_permission" => role_permission_params}) do
    with {:ok, %RolePermission{} = role_permission} <-
           Auth.create_role_permission(role_permission_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_role_permission_path(conn, :show, role_permission))
      |> render("show.json", role_permission: role_permission)
    end
  end

  def show(conn, %{"id" => id}) do
    role_permission = Auth.get_role_permission!(id)
    render(conn, "show.json", role_permission: role_permission)
  end

  def update(conn, %{"id" => id, "role_permission" => role_permission_params}) do
    role_permission = Auth.get_role_permission!(id)

    with {:ok, %RolePermission{} = role_permission} <-
           Auth.update_role_permission(role_permission, role_permission_params) do
      render(conn, "show.json", role_permission: role_permission)
    end
  end

  def delete(conn, %{"id" => id}) do
    role_permission = Auth.get_role_permission!(id)

    with {:ok, %RolePermission{}} <- Auth.delete_role_permission(role_permission) do
      send_resp(conn, :no_content, "")
    end
  end
end
