defmodule PulapWeb.API.V1.RoleController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Role

  action_fallback(PulapWeb.API.FallbackController)

  def index(conn, _params) do
    roles = Auth.list_roles()
    render(conn, "index.json", roles: roles)
  end

  def create(conn, %{"role" => role_params}) do
    with {:ok, %Role{} = role} <- Auth.create_role(role_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_tenure_path(conn, :show, role))
      |> render("show.json", role: role)
    end
  end

  def show(conn, %{"id" => id}) do
    role = Auth.get_role!(id)
    render(conn, "show.json", role: role)
  end

  def update(conn, %{"id" => id, "role" => role_params}) do
    role = Auth.get_role!(id)

    with {:ok, %Role{} = role} <- Auth.update_role(role, role_params) do
      render(conn, "show.json", role: role)
    end
  end

  def delete(conn, %{"id" => id}) do
    role = Auth.get_role!(id)

    with {:ok, %Role{}} <- Auth.delete_role(role) do
      send_resp(conn, :no_content, "")
    end
  end
end
