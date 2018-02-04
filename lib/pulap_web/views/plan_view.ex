defmodule PulapWeb.PlanView do
  use PulapWeb, :view
  alias PulapWeb.PlanView

  def render("index.json", %{plans: plans}) do
    %{data: render_many(plans, PlanView, "plan.json")}
  end

  def render("show.json", %{plan: plan}) do
    %{data: render_one(plan, PlanView, "plan.json")}
  end

  def render("plan.json", %{plan: plan}) do
    %{id: plan.id,
      name: plan.name,
      description: plan.description,
      started_at: plan.started_at,
      ends_at: plan.ends_at,
      is_active: plan.is_active,
      is_logical_deleted: plan.is_logical_deleted}
  end
end
