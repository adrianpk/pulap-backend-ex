defmodule Pulap.App.KeyValue.Context do
  @moduledoc """
  The.App.KeyValue.Context context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo
  alias Pulap.App.KeyValue
  alias Pulap.App.KeyValue.Query

  @doc """
  Returns the list of key_value.

  ## Examples

      iex> list()
      [%KeyValue{}, ...]

  """
  def list do
    Repo.all(KeyValue)
  end

  @doc """
  Gets a single key_value.

  Raises `Ecto.NoResultsError` if the Real estate does not exist.

  ## Examples

      iex> get!(123)
      %KeyValue{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(KeyValue, id)

  @doc """
  Creates a key_value.

  ## Examples

      iex> create(%{field: value})
      {:ok, %KeyValue{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %KeyValue{}
    |> KeyValue.update_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a key_value.

  ## Examples

      iex> update(key_value, %{field: new_value})
      {:ok, %KeyValue{}}

      iex> update(key_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%KeyValue{} = key_value, attrs) do
    key_value
    |> KeyValue.update_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a KeyValue.

  ## Examples

      iex> delete(key_value)
      {:ok, %KeyValue{}}

      iex> delete(key_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%KeyValue{} = key_value) do
    Repo.delete(key_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking key_value changes.

  ## Examples

      iex> change(key_value)
      %Ecto.Changeset{source: %KeyValue{}}

  """
  def change(%KeyValue{} = key_value) do
    KeyValue.changeset(key_value, %{})
  end

  @doc """
  Gets a single key_value.

  Returns nil if the Real estate does not exist.

  ## Examples

      iex> get_by_key(key)
      %KeyValue{}

      iex> get_by_key(key)
      nil

  """
  def get_by_key(key), do: Repo.get_by(KeyValue, key: key)
  
  @doc """
  Returns a list of current key values set names.

  ## Examples

      iex> list_sets()
      [%KeyValue{}, ...]

  """
  def list_sets(queryable \\ KeyValue) do
    queryable
    |> Query.distinct_set_names()
    |> Repo.all()
  end

  @doc """
  Returns a map of pairs of key-value used for populating html select input %{option => id}

  ## Examples

      iex> html_select_values()
      %{"Value" => "Id", ...}

  """
  def html_sets_select_values(conn) do
    list_sets()
    |> Enum.map(&[to_string(&1.set), to_string(&1.set)])
    |> Enum.map(fn [x, y] -> {x, y} end)
    |> Map.new()
    |> Enum.sort_by(&elem(&1, 1))
  end

  @doc """
  Returns a string with comma-separated values of distinct key-value set names used for populating html input autocomplete data lists.

  ## Examples

    sets= KeyValueContext.sets_data_list_string(conn)
      iex> html_data_list_string()
      "Value, Value_02, Value_03..."

  """
  def sets_data_list_string(conn) do
    list_sets()
    |> Enum.map(&[to_string(&1.set)])
    |> Enum.join(", ")
  end

  @doc """
  Returns the list of key_value for an specific set.

  ## Examples

      iex> list_set(set)
      [%KeyValue{}, ...]

  """
  def list_set(set, queryable \\ KeyValue) do
    queryable
    |> Query.where_set(set)
    |> Repo.all()
  end

  @doc """
  Returns the list of key_value for an specific set and locale.

  ## Examples

      iex> list_set_for_locale(set, locale)
      [%KeyValue{}, ...]

  """
  def list_set_by_locale(set, locale, queryable \\ KeyValue) do
    queryable
    |> Query.where_set_and_locale(set, locale)
    |> Repo.all()
  end

  @doc """
  Returns a map of pairs of key-value used for populating html select input %{option => id}

  ## Examples

      iex> html_select_values()
      %{"Value" => "Id", ...}

  """
  def html_select_values(conn, %{"set" => set, "locale" => locale}) do
    list = list_set_by_locale(set, locale)
    list
    |> Enum.map(&[to_string(&1.value), to_string(&1.key)])
    |> Enum.map(fn [x, y] -> {x, y} end)
    |> Map.new()
    |> Enum.sort_by(&elem(&1, 1))
  end

  @doc """
  Returns a string with comma-separated values of key-value keys used for populating html input autocomplete data lists.

  ## Examples

    sets= KeyValueContext.keys_data_list_string(conn, %{"set" => set, "locale" => locale})
      iex> html_data_list_string()
      "Value, Value_02, Value_03..."

  """
  def keys_data_list_string(conn, %{"set" => set, "locale" => locale}) do
    list = list_set_by_locale(set, locale)
    list
    |> Enum.map(&[to_string(&1.key)])
    |> Enum.join(", ")
  end

  @doc """
  Returns a list of current key values group names.

  ## Examples

      iex> list_groups()
      [%KeyValue{}, ...]

  """
  def list_groups(queryable \\ KeyValue) do
    queryable
    |> Query.distinct_groups()
    |> Repo.all()
  end

  @doc """
  Returns a string with comma-separated values of key-value´s groups used for populating html input autocomplete data lists.

  ## Examples

    iex> groups_data_list_string()
    "Group, Group_02, Group_03..."

  """
  def groups_data_list_string(conn) do
    list_groups()
    |> Enum.map(&[to_string(&1.key_group)])
    |> Enum.join(", ")
  end

  @doc """
  Returns a list of current key values subgroup names.

  ## Examples

      iex> list_subgroup()
      [%KeyValue{}, ...]

  """
  def list_subgroups(queryable \\ KeyValue) do
    queryable
    |> Query.distinct_subgroups()
    |> Repo.all()
  end

  @doc """
  Returns a string with comma-separated values of key-value's subgroups used for populating html input autocomplete data lists.

  ## Examples

    iex> subgroups_data_list_string()
    "Subgroup, Subroup_02, Subgroup_03..."

  """
  def subgroups_data_list_string(conn) do
    list_subgroups()
    |> Enum.map(&[to_string(&1.key_subgroup)])
    |> Enum.join(", ")
  end
end
