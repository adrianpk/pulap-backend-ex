defmodule PulapWeb.HTML.PageController do
  use PulapWeb, :controller

  plug :authenticate when action in [:index]

  def index(conn, _params) do
    render conn, "index.html"
  end

  require IEx

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user() do
      conn
    else
      conn
      |> put_flash(:error, "You must be signed in to access that page.")
      |> redirect(to: session_path(conn, :new))
      |> halt()
    end
  end
end
