defmodule PulapWeb.ControllersHelpers do
  @moduledoc """
  Provides helper functions to some recurring tasks in controllers.

  ## Examples

  iex> PulapWeb.ControllersHelpers.update_user(user_roles_changeset, user)
  %Pulap.Auth.User{}

  """

  alias Pulap.Auth.User
  alias Pulap.Auth.Role
  alias Pulap.Auth.Organization

  def update_organization(user_roles_changeset, organization \\ %Organization{}) do
    changeset =
      user_roles_changeset
      |> Ecto.Changeset.put_assoc(:organization, to_changeset(organization))

    changeset
  end

  def update_user(user_roles_changeset, user \\ %User{}) do
    changeset =
      user_roles_changeset
      |> Ecto.Changeset.put_assoc(:user, to_changeset(user))

    changeset
  end

  def update_role(user_roles_changeset, role \\ %Role{}) do
    changeset =
      user_roles_changeset
      |> Ecto.Changeset.put_assoc(:role, to_changeset(role))

    changeset
  end

  # def update_roles(user_changeset, roles \\ %Role{}) do
  #   changeset = user_changeset
  #               |> Ecto.Changeset.put_assoc(:roles, to_changeset(roles))
  #   changeset
  # end

  def strkeys_to_atom(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end

  def to_changeset(struct) do
    Ecto.Changeset.change(struct)
  end

  def to_changeset_all(struct_list) do
    Enum.map(struct_list, &Ecto.Changeset.change/1)
  end
end
