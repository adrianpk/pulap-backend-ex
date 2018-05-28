defmodule PulapWeb.HTML.Managed.RealEstateController do
  use PulapWeb, :controller

  # alias Pulap.Biz
  alias Pulap.Biz.RealEstate.Context, as: RealEstateContext
  alias Pulap.Biz.RealEstate
  alias PulapWeb.Auth.Helpers

  def index(conn, _params) do
    context =
      case Helpers.get_context(conn) do
        %{user: user} ->
          user |> Repo.preload(:managed_real_estate)

        %{organization: organization} ->
          organization |> Repo.preload(:managed)
      end

    render(conn, "index.html", real_estate: context.managed())
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

  def edit_presentation(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit.html", real_estate: real_estate, changeset: changeset)
  end

  def update_presentation(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_presentation(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_presentation, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_address(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit_address.html", real_estate: real_estate, changeset: changeset)
  end

  def update_address(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_address(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_address, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_address.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_main_features(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit_main_features.html", real_estate: real_estate, changeset: changeset)
  end

  def update_main_features(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_main_features(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_main_features, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_main_features.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_services(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit_services.html", real_estate: real_estate, changeset: changeset)
  end

  def update_services(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_services(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_services, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_services.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_equipment(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit_equipment.html", real_estate: real_estate, changeset: changeset)
  end

  def update_equipment(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_equipment(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_equipment, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_equipment.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_prices(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit_prices.html", real_estate: real_estate, changeset: changeset)
  end

  def update_prices(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_prices(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_prices, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_prices.html", real_estate: real_estate, changeset: changeset)
    end
  end
end
