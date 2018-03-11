defmodule PulapWeb.RoleView do
  use PulapWeb, :view
  alias PulapWeb.RoleView

  def render("index.json", %{roles: roles}) do
    %{data: render_many(roles, RoleView, "role.json")}
  end

  def render("show.json", %{role: role}) do
    %{data: render_one(role, RoleView, "role.json")}
  end

  def render("role.json", %{role: role}) do
    %{id: role.id,
      organization_name: role.organization_name,
      name: role.name,
      description: role.description,
      is_active: role.is_active,
      is_logical_deleted: role.is_logical_deleted}
  end
end
