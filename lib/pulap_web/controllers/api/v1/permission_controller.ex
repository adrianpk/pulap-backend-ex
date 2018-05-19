defmodule PulapWeb.API.V1.PermissionController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Permission

  action_fallback(PulapWeb.API.FallbackController)

  def index(conn, _params) do
    permissions = Auth.list_permissions()
    render(conn, "index.json", permissions: permissions)
  end

  def create(conn, %{"permission" => permission_params}) do
    with {:ok, %Permission{} = permission} <- Auth.create_permission(permission_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_permission_path(conn, :show, permission))
      |> render("show.json", permission: permission)
    end
  end

  def show(conn, %{"id" => id}) do
    permission = Auth.get_permission!(id)
    render(conn, "show.json", permission: permission)
  end

  def update(conn, %{"id" => id, "permission" => permission_params}) do
    permission = Auth.get_permission!(id)

    with {:ok, %Permission{} = permission} <-
           Auth.update_permission(permission, permission_params) do
      render(conn, "show.json", permission: permission)
    end
  end

  def delete(conn, %{"id" => id}) do
    permission = Auth.get_permission!(id)

    with {:ok, %Permission{}} <- Auth.delete_permission(permission) do
      send_resp(conn, :no_content, "")
    end
  end
end
