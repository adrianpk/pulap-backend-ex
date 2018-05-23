defmodule Pulap.Biz.Managed.RealEstate do
  @moduledoc false

  alias Pulap.Repo
  alias Pulap.Biz.RealEstate
  alias Pulap.Biz.Managed.Query

  def list_owned(owner_id, queryable \\ RealEstate) do
    queryable
    |> Query.where_owner(owner_id)
    |> Repo.all()
  end

  def list_managed(manager_id, queryable \\ RealEstate) do
    queryable
    |> Query.where_manager(manager_id)
    |> Repo.all()
  end
end
