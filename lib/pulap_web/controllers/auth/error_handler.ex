defmodule PulapWeb.Auth.ErrorHandler do
  import Plug.Conn
  import PulapWeb.Router.Helpers, only: [page_path: 2]

  def auth_error(conn, {type, _reason}, _opts) do
    body = to_string(type)

    conn
    |> Phoenix.Controller.redirect(to: PulapWeb.Router.Helpers.session_path(conn, :new))
  end
end
