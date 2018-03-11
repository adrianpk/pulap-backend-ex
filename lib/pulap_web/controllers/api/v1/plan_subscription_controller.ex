defmodule PulapWeb.API.V1.PlanSubscriptionController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.PlanSubscription

  action_fallback PulapWeb.API.FallbackController

  def index(conn, _params) do
    plan_subscriptions = Biz.list_plan_subscriptions()
    render(conn, "index.json", plan_subscriptions: plan_subscriptions)
  end

  def create(conn, %{"plan_subscription" => plan_subscription_params}) do
    with {:ok, %PlanSubscription{} = plan_subscription} <- Biz.create_plan_subscription(plan_subscription_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_v1_plan_subscription_path(conn, :show, plan_subscription))
      |> render("show.json", plan_subscription: plan_subscription)
    end
  end

  def show(conn, %{"id" => id}) do
    plan_subscription = Biz.get_plan_subscription!(id)
    render(conn, "show.json", plan_subscription: plan_subscription)
  end

  def update(conn, %{"id" => id, "plan_subscription" => plan_subscription_params}) do
    plan_subscription = Biz.get_plan_subscription!(id)

    with {:ok, %PlanSubscription{} = plan_subscription} <- Biz.update_plan_subscription(plan_subscription, plan_subscription_params) do
      render(conn, "show.json", plan_subscription: plan_subscription)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan_subscription = Biz.get_plan_subscription!(id)
    with {:ok, %PlanSubscription{}} <- Biz.delete_plan_subscription(plan_subscription) do
      send_resp(conn, :no_content, "")
    end
  end
end
