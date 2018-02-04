defmodule Pulap.Biz do
  @moduledoc """
  The Biz context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.Biz.Plan

  @doc """
  Returns the list of plans.

  ## Examples

      iex> list_plans()
      [%Plan{}, ...]

  """
  def list_plans do
    Repo.all(Plan)
  end

  @doc """
  Gets a single plan.

  Raises `Ecto.NoResultsError` if the Plan does not exist.

  ## Examples

      iex> get_plan!(123)
      %Plan{}

      iex> get_plan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plan!(id), do: Repo.get!(Plan, id)

  @doc """
  Creates a plan.

  ## Examples

      iex> create_plan(%{field: value})
      {:ok, %Plan{}}

      iex> create_plan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plan(attrs \\ %{}) do
    %Plan{}
    |> Plan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plan.

  ## Examples

      iex> update_plan(plan, %{field: new_value})
      {:ok, %Plan{}}

      iex> update_plan(plan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plan(%Plan{} = plan, attrs) do
    plan
    |> Plan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Plan.

  ## Examples

      iex> delete_plan(plan)
      {:ok, %Plan{}}

      iex> delete_plan(plan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plan(%Plan{} = plan) do
    Repo.delete(plan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plan changes.

  ## Examples

      iex> change_plan(plan)
      %Ecto.Changeset{source: %Plan{}}

  """
  def change_plan(%Plan{} = plan) do
    Plan.changeset(plan, %{})
  end

  alias Pulap.Biz.PlanSubscription

  @doc """
  Returns the list of plan_subscriptions.

  ## Examples

      iex> list_plan_subscriptions()
      [%PlanSubscription{}, ...]

  """
  def list_plan_subscriptions do
    Repo.all(PlanSubscription)
  end

  @doc """
  Gets a single plan_subscription.

  Raises `Ecto.NoResultsError` if the Plan subscription does not exist.

  ## Examples

      iex> get_plan_subscription!(123)
      %PlanSubscription{}

      iex> get_plan_subscription!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plan_subscription!(id), do: Repo.get!(PlanSubscription, id)

  @doc """
  Creates a plan_subscription.

  ## Examples

      iex> create_plan_subscription(%{field: value})
      {:ok, %PlanSubscription{}}

      iex> create_plan_subscription(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plan_subscription(attrs \\ %{}) do
    %PlanSubscription{}
    |> PlanSubscription.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plan_subscription.

  ## Examples

      iex> update_plan_subscription(plan_subscription, %{field: new_value})
      {:ok, %PlanSubscription{}}

      iex> update_plan_subscription(plan_subscription, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plan_subscription(%PlanSubscription{} = plan_subscription, attrs) do
    plan_subscription
    |> PlanSubscription.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PlanSubscription.

  ## Examples

      iex> delete_plan_subscription(plan_subscription)
      {:ok, %PlanSubscription{}}

      iex> delete_plan_subscription(plan_subscription)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plan_subscription(%PlanSubscription{} = plan_subscription) do
    Repo.delete(plan_subscription)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plan_subscription changes.

  ## Examples

      iex> change_plan_subscription(plan_subscription)
      %Ecto.Changeset{source: %PlanSubscription{}}

  """
  def change_plan_subscription(%PlanSubscription{} = plan_subscription) do
    PlanSubscription.changeset(plan_subscription, %{})
  end
end
