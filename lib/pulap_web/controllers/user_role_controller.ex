defmodule PulapWeb.UserRoleController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.UserRole

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    user_roles = Auth.list_user_roles()
    render(conn, "index.json", user_roles: user_roles)
  end

  def create(conn, %{"user_role" => user_role_params}) do
    with {:ok, %UserRole{} = user_role} <- Auth.create_user_role(user_role_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_role_path(conn, :show, user_role))
      |> render("show.json", user_role: user_role)
    end
  end

  require IEx
  def show(conn, %{"id" => id}) do
    IEx.pry
    user_role = Auth.get_user_role!(id)
    render(conn, "show.json", user_role: user_role)
  end

  def update(conn, %{"id" => id, "user_role" => user_role_params}) do
    user_role = Auth.get_user_role!(id)

    with {:ok, %UserRole{} = user_role} <- Auth.update_user_role(user_role, user_role_params) do
      render(conn, "show.json", user_role: user_role)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_role = Auth.get_user_role!(id)
    with {:ok, %UserRole{}} <- Auth.delete_user_role(user_role) do
      send_resp(conn, :no_content, "")
    end
  end
end
