defmodule Pulap.App.KeyValue.Query do
  @moduledoc false

  import Ecto.Query

  def distinct_set_names(queryable) do
    queryable
    |> distinct([q], asc: q.set)
    |> order_by([q], q.set)

    # |> select([q], q.set)
  end

  def where_set_and_locale(queryable, set, locale) do
    queryable
    |> where([q], q.set == ^set)
    |> where([q], q.locale == ^locale)
    |> order_by(asc: :key)
  end

  def distinct_groups(queryable) do
    queryable
    |> distinct([q], asc: q.key_group)
    |> order_by([q], q.set)
  end

  def distinct_subgroups(queryable) do
    queryable
    |> distinct([q], asc: q.key_subgroup)
    |> order_by([q], q.set)
  end
end
