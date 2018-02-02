defmodule PulapWeb.ResourcePermissionView do
  use PulapWeb, :view
  alias PulapWeb.ResourcePermissionView

  def render("index.json", %{resource_permissions: resource_permissions}) do
    %{data: render_many(resource_permissions, ResourcePermissionView, "resource_permission.json")}
  end

  def render("show.json", %{resource_permission: resource_permission}) do
    %{data: render_one(resource_permission, ResourcePermissionView, "resource_permission.json")}
  end

  def render("resource_permission.json", %{resource_permission: resource_permission}) do
    %{id: resource_permission.id,
      organization_name: resource_permission.organization_name,
      name: resource_permission.name,
      description: resource_permission.description,
      tag: resource_permission.tag,
      is_active: resource_permission.is_active,
      is_logical_deleted: resource_permission.is_logical_deleted}
  end
end
