defmodule PulapWeb.Auth.AuthPlug do
  @moduledoc false

  import Plug.Conn
  alias Pulap.Auth
  require Logger
  require IEx

  def init(opts) do
    Logger.debug(inspect(opts))
    # Keyword.fetch!(opts, :repo)
  end

  def call(conn, _repo) do
    # user_id = get_session(conn, :user_id)
    user_id = PulapWeb.Auth.Guardian.Plug.current_resource(conn)
    user = user_id && Auth.get_user!(user_id)
    # user = user_id && repo.get(User, user_id)
    conn |> assign(:current_user, user)
  end
end
