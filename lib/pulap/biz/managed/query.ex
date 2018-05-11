defmodule Pulap.Biz.Managed.Query do
  import Ecto.Query

  def where_manager(queryable, manager_id) do
    queryable
    |> where([q], q.user_id == ^manager_id)
  end

end
