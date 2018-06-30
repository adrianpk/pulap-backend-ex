defmodule Pulap.Biz.RealEstate.Context do
  @moduledoc """
  The Biz.RealEstate.Context context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.Biz.RealEstate
  alias Pulap.Biz.Managership
  alias Pulap.Biz.Ownership
  alias Pulap.Auth.User
  require IEx

  @doc """
  Returns the list of real_estate.

  ## Examples

      iex> list()
      [%RealEstate{}, ...]

  """
  def list do
    Repo.all(RealEstate)
  end

  @doc """
  Gets a single real_estate.

  Raises `Ecto.NoResultsError` if the Real estate does not exist.

  ## Examples

      iex> get!(123)
      %RealEstate{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(RealEstate, id)

  @doc """
  Creates a real_estate.

  ## Examples

      iex> create(%{field: value})
      {:ok, %RealEstate{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %RealEstate{}
    |> RealEstate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a managed real_estate.

  ## Examples

      iex> create(:managed, %{field: value}, manager)
      {:ok, %RealEstate{}}

      iex> create(:managed, %{field: bad_value}, manager)
      {:error, %Ecto.Changeset{}}

  """
  def create(:managed, attrs \\ %{}, manager) do
    is_owner =
      attrs["manager_is_owner"]
      |> String.to_existing_atom()

    result =
      Repo.transaction(fn ->
        user =
          manager
          |> Ecto.Changeset.change()

        real_estate =
          %RealEstate{}
          |> RealEstate.edit_presentation_changeset(attrs)

        if is_owner do
          ownership =
            %Ownership{}
            |> Repo.preload([:user, :real_estate])
            |> Ownership.changeset(attrs)
            |> Ecto.Changeset.put_assoc(:user, user)
            |> Ecto.Changeset.put_assoc(:real_estate, real_estate)
            |> Ownership.update_changeset_fields(manager.username, real_estate.changes.name)

          Repo.insert(ownership)
        end

        managership =
          %Managership{}
          |> Repo.preload([:user, :real_estate])
          |> Managership.changeset(attrs)
          |> Ecto.Changeset.put_change(:is_owner, is_owner)
          |> Ecto.Changeset.put_assoc(:user, user)
          |> Ecto.Changeset.put_assoc(:real_estate, real_estate)
          |> Managership.update_changeset_fields(manager.username, real_estate.changes.name)

        Repo.insert(managership)
      end)

    case result do
      {:ok, {:ok, managership}} ->
        {:ok, managership.real_estate}

      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Updates a real_estate.

  ## Examples

      iex> update(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a RealEstate.

  ## Examples

      iex> delete(real_estate)
      {:ok, %RealEstate{}}

      iex> delete(real_estate)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%RealEstate{} = real_estate) do
    Repo.delete(real_estate)
  end

  @doc """
  Updates a real_estate presentation.

  ## Examples

      iex> update_presentation(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update_presentation(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_presentation(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.edit_presentation_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a real_estate address.

  ## Examples

      iex> update_address(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update_address(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_address(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.edit_address_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a real_estate main_features.

  ## Examples

      iex> update_main_features(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update_main_features(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_main_features(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.edit_main_features_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a real_estate services.

  ## Examples

      iex> update_services(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update_services(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_services(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.edit_services_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a real_estate equipment.

  ## Examples

      iex> update_equipment(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update_equipment(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_equipment(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.edit_equipment_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a real_estate prices.

  ## Examples

      iex> update_prices(real_estate, %{field: new_value})
      {:ok, %RealEstate{}}

      iex> update_prices(real_estate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prices(%RealEstate{} = real_estate, attrs) do
    real_estate
    |> RealEstate.edit_prices_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking real_estate changes.

  ## Examples

      iex> change(real_estate)
      %Ecto.Changeset{source: %RealEstate{}}

  """
  def change(%RealEstate{} = real_estate) do
    RealEstate.changeset(real_estate, %{})
  end
end
