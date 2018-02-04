defmodule Pulap.BizTest do
  use Pulap.DataCase

  alias Pulap.Biz

  describe "plans" do
    alias Pulap.Biz.Plan

    @valid_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def plan_fixture(attrs \\ %{}) do
      {:ok, plan} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_plan()

      plan
    end

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert Biz.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert Biz.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      assert {:ok, %Plan{} = plan} = Biz.create_plan(@valid_attrs)
      assert plan.description == "some description"
      assert plan.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert plan.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plan.is_active == true
      assert plan.is_logical_deleted == true
      assert plan.name == "some name"
      assert plan.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      assert {:ok, plan} = Biz.update_plan(plan, @update_attrs)
      assert %Plan{} = plan
      assert plan.description == "some updated description"
      assert plan.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert plan.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plan.is_active == false
      assert plan.is_logical_deleted == false
      assert plan.name == "some updated name"
      assert plan.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_plan(plan, @invalid_attrs)
      assert plan == Biz.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = Biz.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = Biz.change_plan(plan)
    end
  end

  describe "plan_subscriptions" do
    alias Pulap.Biz.PlanSubscription

    @valid_attrs %{description: "some description", ends_at: "2010-04-17 14:00:00.000000Z", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", ends_at: "2011-05-18 15:01:01.000000Z", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, ends_at: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, started_at: nil}

    def plan_subscription_fixture(attrs \\ %{}) do
      {:ok, plan_subscription} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Biz.create_plan_subscription()

      plan_subscription
    end

    test "list_plan_subscriptions/0 returns all plan_subscriptions" do
      plan_subscription = plan_subscription_fixture()
      assert Biz.list_plan_subscriptions() == [plan_subscription]
    end

    test "get_plan_subscription!/1 returns the plan_subscription with given id" do
      plan_subscription = plan_subscription_fixture()
      assert Biz.get_plan_subscription!(plan_subscription.id) == plan_subscription
    end

    test "create_plan_subscription/1 with valid data creates a plan_subscription" do
      assert {:ok, %PlanSubscription{} = plan_subscription} = Biz.create_plan_subscription(@valid_attrs)
      assert plan_subscription.description == "some description"
      assert plan_subscription.ends_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert plan_subscription.id == "7488a646-e31f-11e4-aace-600308960662"
      assert plan_subscription.is_active == true
      assert plan_subscription.is_logical_deleted == true
      assert plan_subscription.name == "some name"
      assert plan_subscription.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_plan_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Biz.create_plan_subscription(@invalid_attrs)
    end

    test "update_plan_subscription/2 with valid data updates the plan_subscription" do
      plan_subscription = plan_subscription_fixture()
      assert {:ok, plan_subscription} = Biz.update_plan_subscription(plan_subscription, @update_attrs)
      assert %PlanSubscription{} = plan_subscription
      assert plan_subscription.description == "some updated description"
      assert plan_subscription.ends_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert plan_subscription.id == "7488a646-e31f-11e4-aace-600308960668"
      assert plan_subscription.is_active == false
      assert plan_subscription.is_logical_deleted == false
      assert plan_subscription.name == "some updated name"
      assert plan_subscription.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_plan_subscription/2 with invalid data returns error changeset" do
      plan_subscription = plan_subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Biz.update_plan_subscription(plan_subscription, @invalid_attrs)
      assert plan_subscription == Biz.get_plan_subscription!(plan_subscription.id)
    end

    test "delete_plan_subscription/1 deletes the plan_subscription" do
      plan_subscription = plan_subscription_fixture()
      assert {:ok, %PlanSubscription{}} = Biz.delete_plan_subscription(plan_subscription)
      assert_raise Ecto.NoResultsError, fn -> Biz.get_plan_subscription!(plan_subscription.id) end
    end

    test "change_plan_subscription/1 returns a plan_subscription changeset" do
      plan_subscription = plan_subscription_fixture()
      assert %Ecto.Changeset{} = Biz.change_plan_subscription(plan_subscription)
    end
  end
end
