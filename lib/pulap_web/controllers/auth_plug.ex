defmodule PulapWeb.HTML.AuthPlug do
  import Plug.Conn

  alias Pulap.Auth.User
  # alias Pulap.Auth

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    # user = user_id && Auth.get_user!(user_id)
    user = user_id && repo.get(User, user_id)
    assign(conn, :current_user, user)
  end
end