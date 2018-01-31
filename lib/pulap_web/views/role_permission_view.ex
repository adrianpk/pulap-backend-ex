defmodule PulapWeb.RolePermissionView do
  use PulapWeb, :view
  alias PulapWeb.RolePermissionView

  def render("index.json", %{role_permissions: role_permissions}) do
    %{data: render_many(role_permissions, RolePermissionView, "role_permission.json")}
  end

  def render("show.json", %{role_permission: role_permission}) do
    %{data: render_one(role_permission, RolePermissionView, "role_permission.json")}
  end

  def render("role_permission.json", %{role_permission: role_permission}) do
    %{id: role_permission.id,
      id: role_permission.id,
      organization_name: role_permission.organization_name,
      name: role_permission.name,
      description: role_permission.description,
      tag: role_permission.tag,
      is_active: role_permission.is_active,
      is_logical_deleted: role_permission.is_logical_deleted}
  end
end
