defmodule PulapWeb.PlanControllerTest do
  use PulapWeb.ConnCase

  alias Pulap.Biz
  alias Pulap.Biz.Plan

  @create_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
  @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
  @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

  def fixture(:plan) do
    {:ok, plan} = Biz.create_plan(@create_attrs)
    plan
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all plans", %{conn: conn} do
      conn = get conn, plan_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create plan" do
    test "renders plan when data is valid", %{conn: conn} do
      conn = post conn, plan_path(conn, :create), plan: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, plan_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "ends_at" => "2010-04-17 14:00:00.000000Z",
        "id" => "7488a646-e31f-11e4-aace-600308960662",
        "is_active" => true,
        "is_logical_deleted" => true,
        "name" => "some name",
        "started_at" => "2010-04-17 14:00:00.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, plan_path(conn, :create), plan: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update plan" do
    setup [:create_plan]

    test "renders plan when data is valid", %{conn: conn, plan: %Plan{id: id} = plan} do
      conn = put conn, plan_path(conn, :update, plan), plan: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, plan_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "ends_at" => "2011-05-18 15:01:01.000000Z",
        "id" => "7488a646-e31f-11e4-aace-600308960668",
        "is_active" => false,
        "is_logical_deleted" => false,
        "name" => "some updated name",
        "started_at" => "2011-05-18 15:01:01.000000Z"}
    end

    test "renders errors when data is invalid", %{conn: conn, plan: plan} do
      conn = put conn, plan_path(conn, :update, plan), plan: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete plan" do
    setup [:create_plan]

    test "deletes chosen plan", %{conn: conn, plan: plan} do
      conn = delete conn, plan_path(conn, :delete, plan)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, plan_path(conn, :show, plan)
      end
    end
  end

  defp create_plan(_) do
    plan = fixture(:plan)
    {:ok, plan: plan}
  end
end
