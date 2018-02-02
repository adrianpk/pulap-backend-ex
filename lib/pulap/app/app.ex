defmodule Pulap.App do
  @moduledoc """
  The App context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.App.PropertySet

  @doc """
  Returns the list of property_sets.

  ## Examples

      iex> list_property_sets()
      [%PropertySet{}, ...]

  """
  def list_property_sets do
    Repo.all(PropertySet)
  end

  @doc """
  Gets a single property_set.

  Raises `Ecto.NoResultsError` if the Property set does not exist.

  ## Examples

      iex> get_property_set!(123)
      %PropertySet{}

      iex> get_property_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_property_set!(id), do: Repo.get!(PropertySet, id)

  @doc """
  Creates a property_set.

  ## Examples

      iex> create_property_set(%{field: value})
      {:ok, %PropertySet{}}

      iex> create_property_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_property_set(attrs \\ %{}) do
    %PropertySet{}
    |> PropertySet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a property_set.

  ## Examples

      iex> update_property_set(property_set, %{field: new_value})
      {:ok, %PropertySet{}}

      iex> update_property_set(property_set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_property_set(%PropertySet{} = property_set, attrs) do
    property_set
    |> PropertySet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PropertySet.

  ## Examples

      iex> delete_property_set(property_set)
      {:ok, %PropertySet{}}

      iex> delete_property_set(property_set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_property_set(%PropertySet{} = property_set) do
    Repo.delete(property_set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking property_set changes.

  ## Examples

      iex> change_property_set(property_set)
      %Ecto.Changeset{source: %PropertySet{}}

  """
  def change_property_set(%PropertySet{} = property_set) do
    PropertySet.changeset(property_set, %{})
  end
end
