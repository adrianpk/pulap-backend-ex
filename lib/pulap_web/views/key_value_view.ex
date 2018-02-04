defmodule PulapWeb.KeyValueView do
  use PulapWeb, :view
  alias PulapWeb.KeyValueView

  def render("index.json", %{key_values: key_values}) do
    %{data: render_many(key_values, KeyValueView, "key_value.json")}
  end

  def render("show.json", %{key_value: key_value}) do
    %{data: render_one(key_value, KeyValueView, "key_value.json")}
  end

  def render("key_value.json", %{key_value: key_value}) do
    %{id: key_value.id,
      set: key_value.set,
      key: key_value.key,
      value: key_value.value,
      key_group: key_value.key_group,
      key_subgroup: key_value.key_subgroup,
      locale: key_value.locale,
      position: key_value.position,
      is_active: key_value.is_active,
      is_logical_deleted: key_value.is_logical_deleted}
  end
end
