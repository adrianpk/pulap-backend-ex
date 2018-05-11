defmodule PulapWeb.API.V1.ManagershipView do
  use PulapWeb, :view
  alias PulapWeb.API.V1.ManagershipView

  def render("index.json", %{managership: managership}) do
    %{data: render_many(managership, ManagershipView, "managership.json")}
  end

  def render("show.json", %{managership: managership}) do
    %{data: render_one(managership, ManagershipView, "managership.json")}
  end

  def render("managership.json", %{managership: managership}) do
    %{id: managership.id,
      started_at: managership.started_at,
      ends_at: managership.ends_at,
      is_active: managership.is_active,
      default: managership.default,
      is_logical_deleted: managership.is_logical_deleted}
  end
end
