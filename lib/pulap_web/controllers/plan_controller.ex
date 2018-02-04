defmodule PulapWeb.PlanController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.Plan

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    plans = Biz.list_plans()
    render(conn, "index.json", plans: plans)
  end

  def create(conn, %{"plan" => plan_params}) do
    with {:ok, %Plan{} = plan} <- Biz.create_plan(plan_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", plan_path(conn, :show, plan))
      |> render("show.json", plan: plan)
    end
  end

  def show(conn, %{"id" => id}) do
    plan = Biz.get_plan!(id)
    render(conn, "show.json", plan: plan)
  end

  def update(conn, %{"id" => id, "plan" => plan_params}) do
    plan = Biz.get_plan!(id)

    with {:ok, %Plan{} = plan} <- Biz.update_plan(plan, plan_params) do
      render(conn, "show.json", plan: plan)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan = Biz.get_plan!(id)
    with {:ok, %Plan{}} <- Biz.delete_plan(plan) do
      send_resp(conn, :no_content, "")
    end
  end
end
