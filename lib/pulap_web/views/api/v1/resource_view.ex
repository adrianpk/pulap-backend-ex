defmodule PulapWeb.ResourceView do
  use PulapWeb, :view
  alias PulapWeb.ResourceView

  def render("index.json", %{resources: resources}) do
    %{data: render_many(resources, ResourceView, "resource.json")}
  end

  def render("show.json", %{resource: resource}) do
    %{data: render_one(resource, ResourceView, "resource.json")}
  end

  def render("resource.json", %{resource: resource}) do
    %{
      id: resource.id,
      organization_name: resource.organization_name,
      name: resource.name,
      description: resource.description,
      tag: resource.tag,
      is_active: resource.is_active,
      is_logical_deleted: resource.is_logical_deleted
    }
  end
end
