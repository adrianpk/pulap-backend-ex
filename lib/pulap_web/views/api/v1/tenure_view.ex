defmodule PulapWeb.TenureView do
  use PulapWeb, :view
  alias PulapWeb.TenureView

  def render("index.json", %{tenures: tenures}) do
    %{data: render_many(tenures, TenureView, "tenure.json")}
  end

  def render("show.json", %{tenure: tenure}) do
    %{data: render_one(tenure, TenureView, "tenure.json")}
  end

  def render("tenure.json", %{tenure: tenure}) do
    %{
      id: tenure.id,
      job_title: tenure.job_title,
      job_description: tenure.job_description,
      started_at: tenure.started_at,
      ends_at: tenure.ends_at,
      is_active: tenure.is_active,
      is_logical_deleted: tenure.is_logical_deleted
    }
  end
end
