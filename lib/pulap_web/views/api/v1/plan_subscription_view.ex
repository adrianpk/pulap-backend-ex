defmodule PulapWeb.PlanSubscriptionView do
  use PulapWeb, :view
  alias PulapWeb.PlanSubscriptionView

  def render("index.json", %{plan_subscriptions: plan_subscriptions}) do
    %{data: render_many(plan_subscriptions, PlanSubscriptionView, "plan_subscription.json")}
  end

  def render("show.json", %{plan_subscription: plan_subscription}) do
    %{data: render_one(plan_subscription, PlanSubscriptionView, "plan_subscription.json")}
  end

  def render("plan_subscription.json", %{plan_subscription: plan_subscription}) do
    %{
      id: plan_subscription.id,
      name: plan_subscription.name,
      description: plan_subscription.description,
      started_at: plan_subscription.started_at,
      ends_at: plan_subscription.ends_at,
      is_active: plan_subscription.is_active,
      is_logical_deleted: plan_subscription.is_logical_deleted
    }
  end
end
