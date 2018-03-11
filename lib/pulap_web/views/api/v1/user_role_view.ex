defmodule PulapWeb.UserRoleView do
  use PulapWeb, :view
  alias PulapWeb.UserRoleView

  def render("index.json", %{user_roles: user_roles}) do
    %{data: render_many(user_roles, UserRoleView, "user_role.json")}
  end

  def render("show.json", %{user_role: user_role}) do
    %{data: render_one(user_role, UserRoleView, "user_role.json")}
  end

  def render("user_role.json", %{user_role: user_role}) do
    %{id: user_role.id,
      organization_name: user_role.organization_name,
      name: user_role.name,
      description: user_role.description,
      is_active: user_role.is_active,
      is_logical_deleted: user_role.is_logical_deleted}
  end
end
