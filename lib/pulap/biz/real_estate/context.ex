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
  Returns an `%Ecto.Changeset{}` for tracking real_estate changes.

  ## Examples

      iex> change(real_estate)
      %Ecto.Changeset{source: %RealEstate{}}

  """
  def change(%RealEstate{} = real_estate) do
    RealEstate.changeset(real_estate, %{})
  end

end
