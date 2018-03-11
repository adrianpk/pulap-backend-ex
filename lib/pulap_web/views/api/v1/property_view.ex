defmodule PulapWeb.PropertyView do
  use PulapWeb, :view
  alias PulapWeb.PropertyView

  def render("index.json", %{properties: properties}) do
    %{data: render_many(properties, PropertyView, "property.json")}
  end

  def render("show.json", %{property: property}) do
    %{data: render_one(property, PropertyView, "property.json")}
  end

  def render("property.json", %{property: property}) do
    %{id: property.id,
      property_set_name: property.property_set_name,
      name: property.name,
      description: property.description,
      property_data_type: property.property_data_type,
      boolean: property.boolean,
      date: property.date,
      datetime: property.datetime,
      decimal: property.decimal,
      float: property.float,
      geolocation: property.geolocation,
      integer: property.integer,
      string: property.string,
      time: property.time,
      uuid: property.uuid,
      is_active: property.is_active,
      is_logical_deleted: property.is_logical_deleted}
  end
end
