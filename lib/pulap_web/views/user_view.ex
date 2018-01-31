defmodule PulapWeb.UserView do
  use PulapWeb, :view
  alias PulapWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      password_hash: user.password_hash,
      email: user.email,
      given_name: user.given_name,
      middle_names: user.middle_names,
      family_name: user.family_name,
      card: user.card,
      annotations: user.annotations,
      geolocation: user.geolocation,
      started_at: user.started_at,
      is_active: user.is_active,
      is_logical_deleted: user.is_logical_deleted}
  end
end
