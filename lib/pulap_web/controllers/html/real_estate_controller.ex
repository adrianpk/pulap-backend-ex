defmodule PulapWeb.HTML.RealEstateController do
  use PulapWeb, :controller

  # alias Pulap.Biz
  alias Pulap.Biz.RealEstate
  alias Pulap.Biz.RealEstate.Context, as: RealEstateContext
  alias PulapWeb.Auth.Helpers
  require Logger

  def index(conn, _params) do
    real_estate = RealEstateContext.list()
    render(conn, "index.html", real_estate: real_estate)
  end

  def new(conn, _params) do
    changeset = RealEstateContext.change(%RealEstate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"real_estate" => real_estate_params}) do
    case RealEstateContext.create(real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate created successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    render(conn, "show.html", real_estate: real_estate)
  end

  def edit(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit.html", real_estate: real_estate, changeset: changeset)
  end

  def update(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    {:ok, _real_estate} = RealEstateContext.delete(real_estate)

    conn
    |> put_flash(:info, "Real estate deleted successfully.")
    |> redirect(to: real_estate_path(conn, :index))
  end
end
