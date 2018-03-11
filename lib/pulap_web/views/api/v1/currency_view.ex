defmodule PulapWeb.API.V1.CurrencyView do
  use PulapWeb, :view
  alias PulapWeb.API.V1.CurrencyView

  def render("index.json", %{currencies: currencies}) do
    %{data: render_many(currencies, CurrencyView, "currency.json")}
  end

  def render("show.json", %{currency: currency}) do
    %{data: render_one(currency, CurrencyView, "currency.json")}
  end

  def render("currency.json", %{currency: currency}) do
    %{id: currency.id,
      code: currency.code,
      num_code: currency.num_code,
      minor_unit: currency.minor_unit,
      name: currency.name,
      icon: currency.icon,
      is_active: currency.is_active,
      is_logical_deleted: currency.is_logical_deleted}
  end
end
