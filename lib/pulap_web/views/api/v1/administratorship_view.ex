defmodule PulapWeb.API.V1.AdministratorshipView do
  use PulapWeb, :view
  alias PulapWeb.API.V1.AdministratorshipView

  def render("index.json", %{administratorship: administratorship}) do
    %{data: render_many(administratorship, AdministratorshipView, "administratorship.json")}
  end

  def render("show.json", %{administratorship: administratorship}) do
    %{data: render_one(administratorship, AdministratorshipView, "administratorship.json")}
  end

  def render("administratorship.json", %{administratorship: administratorship}) do
    %{id: administratorship.id,
      started_at: administratorship.started_at,
      ends_at: administratorship.ends_at,
      is_active: administratorship.is_active,
      default: administratorship.default,
      is_logical_deleted: administratorship.is_logical_deleted}
  end
end
