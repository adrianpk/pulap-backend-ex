defmodule Pulap.Biz.RealEstate.Context do
  @moduledoc """
  The Biz.RealEstate.Context context.
  """

  import Ecto.Query, warn: false
  alias Pulap.Repo

  alias Pulap.Biz.RealEstate

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
