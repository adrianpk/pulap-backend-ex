defmodule PulapWeb.GeoAreaView do
  use PulapWeb, :view
  alias PulapWeb.GeoAreaView

  def render("index.json", %{geo_areas: geo_areas}) do
    %{data: render_many(geo_areas, GeoAreaView, "geo_area.json")}
  end

  def render("show.json", %{geo_area: geo_area}) do
    %{data: render_one(geo_area, GeoAreaView, "geo_area.json")}
  end

  def render("geo_area.json", %{geo_area: geo_area}) do
    %{id: geo_area.id,
      adm_level: geo_area.adm_level,
      adm_level_type: geo_area.adm_level_type,
      name: geo_area.name,
      name_loc: geo_area.name_loc,
      alternative_name: geo_area.alternative_name,
      alternative_name_loc: geo_area.alternative_name_loc,
      canonical_name: geo_area.canonical_name,
      canonical_name_loc: geo_area.canonical_name_loc,
      normalized_name: geo_area.normalized_name,
      dialing_code: geo_area.dialing_code,
      zip_code: geo_area.zip_code,
      is_main: geo_area.is_main,
      cards: geo_area.cards,
      geo_areas: geo_area.geo_areas,
      locale: geo_area.locale,
      position: geo_area.position,
      is_active: geo_area.is_active,
      is_logical_deleted: geo_area.is_logical_deleted}
  end
end
