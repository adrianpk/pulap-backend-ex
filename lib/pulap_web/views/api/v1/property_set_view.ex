defmodule PulapWeb.PropertySetView do
  use PulapWeb, :view
  alias PulapWeb.PropertySetView

  def render("index.json", %{property_sets: property_sets}) do
    %{data: render_many(property_sets, PropertySetView, "property_set.json")}
  end

  def render("show.json", %{property_set: property_set}) do
    %{data: render_one(property_set, PropertySetView, "property_set.json")}
  end

  def render("property_set.json", %{property_set: property_set}) do
    %{
      id: property_set.id,
      name: property_set.name,
      description: property_set.description,
      holder_id: property_set.holder_id,
      is_active: property_set.is_active,
      is_logical_deleted: property_set.is_logical_deleted
    }
  end
end
