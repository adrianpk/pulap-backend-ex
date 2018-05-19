defmodule PulapWeb.HTML.DashboardController do
  use PulapWeb, :controller
  require IEx

  # plug :authenticate when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # defp authenticate(conn, _opts) do
  #   a = PulapWeb.Auth.Helpers.user_from_session(conn)
  #   if a != nil do
  #     conn
  #   else
  #     conn
  #     |> put_flash(:error, "You must be signed in to access that page.")
  #     |> redirect(to: session_path(conn, :new))
  #     |> halt()
  #   end
  # end
end
