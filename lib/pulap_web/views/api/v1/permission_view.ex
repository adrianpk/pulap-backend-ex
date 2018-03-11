defmodule PulapWeb.API.V1.PermissionView do
  use PulapWeb, :view
  alias PulapWeb.API.V1.PermissionView

  def render("index.json", %{permissions: permissions}) do
    %{data: render_many(permissions, PermissionView, "permission.json")}
  end

  def render("show.json", %{permission: permission}) do
    %{data: render_one(permission, PermissionView, "permission.json")}
  end

  def render("permission.json", %{permission: permission}) do
    %{id: permission.id,
      organization_name: permission.organization_name,
      name: permission.name,
      description: permission.description,
      is_active: permission.is_active,
      is_logical_deleted: permission.is_logical_deleted}
  end
end
