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
end
