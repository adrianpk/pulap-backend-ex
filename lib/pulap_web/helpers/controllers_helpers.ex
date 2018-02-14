defmodule PulapWeb.ControllersHelpers do
  alias Pulap.Auth.Role

  def update_roles(user_changeset, roles \\ %Role{}) do
    changeset = user_changeset
                |> Ecto.Changeset.put_assoc(:roles, to_changeset(roles))
    changeset
  end

  def strkeys_to_atom(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end

  def to_changeset (structs_list) do
    Enum.map(structs_list, &Ecto.Changeset.change/1)
  end
end
