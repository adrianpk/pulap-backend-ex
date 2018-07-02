defmodule PulapWeb.HTML.Managed.RealEstateController do
  use PulapWeb, :controller

  # alias Pulap.Biz
  alias Pulap.Biz.RealEstate.Context, as: RealEstateContext
  alias Pulap.Biz.RealEstate
  alias PulapWeb.Auth.Helpers
  alias Pulap.App.KeyValue.Context, as: KeyValueContext
  require Logger
  require IEx

  def index(conn, _params) do
    context =
      case Helpers.get_context(conn) do
        %{user: user} ->
          user |> Repo.preload(:managed_real_estate)

        %{organization: organization} ->
          organization |> Repo.preload(:managed_real_estate)
      end

    render(conn, "index.html", real_estate: context.managed_real_estate)
  end

  def new(conn, _params) do
    changeset = RealEstateContext.change(%RealEstate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"real_estate" => real_estate_params}) do
    manager =
      case Helpers.get_context(conn) do
        %{user: user} ->
          user

        %{organization: organization} ->
          organization
      end

    case RealEstateContext.create(:managed, real_estate_params, manager) do
      {:ok, real_estate} ->
        # TODO: Pass Real Estate Country + Administrative Areas to GeoArea Service
        # GeoArea Service shoud create a new GeoArea with this data if it does not exist.
        conn
        |> put_flash(:info, "Real estate created successfully.")
        |> redirect(to: real_estate_path(conn, :edit_address, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :create}
        conn = conn |> put_flash(:error, "Check following errors, please.")
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

  def show_confirm_delete(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "confirm_delete.html", real_estate: real_estate, changeset: changeset)
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
    render(conn, "edit_presentation.html", real_estate: real_estate, changeset: changeset)
  end

  def update_presentation(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_presentation(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_presentation, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn = conn |> put_flash(:error, "Check following errors, please.")
        render(conn, "edit_presentation.html", real_estate: real_estate, changeset: changeset)
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
        conn = conn |> put_flash(:error, "Check following errors, please.")
        render(conn, "edit_address.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_main_features(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    autocomplete_data = get_autocomplete_data(conn, :main_features)

    render(
      conn,
      "edit_main_features.html",
      real_estate: real_estate,
      changeset: changeset,
      autocomplete_data: autocomplete_data
    )
  end

  def update_main_features(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_main_features(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_main_features, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        autocomplete_data = get_autocomplete_data(conn, :main_features)
        conn = conn |> put_flash(:error, "Check following errors, please.")

        render(
          conn,
          "edit_main_features.html",
          real_estate: real_estate,
          changeset: changeset,
          autocomplete_data: autocomplete_data
        )
    end
  end

  def edit_services(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    autocomplete_data = get_autocomplete_data(conn, :services)

    render(
      conn,
      "edit_services.html",
      real_estate: real_estate,
      changeset: changeset,
      autocomplete_data: autocomplete_data
    )
  end

  def update_services(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_services(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_services, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        autocomplete_data = get_autocomplete_data(conn, :services)
        conn = conn |> put_flash(:error, "Check following errors, please.")

        render(
          conn,
          "edit_services.html",
          real_estate: real_estate,
          changeset: changeset,
          autocomplete_data: autocomplete_data
        )
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
        conn = conn |> put_flash(:error, "Check following errors, please.")
        render(conn, "edit_equipment.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_prices(conn, %{"id" => id}) do
    real_estate = RealEstateContext.get!(id)
    changeset = RealEstateContext.change(real_estate)
    render(conn, "edit_prices.html", real_estate: real_estate, changeset: changeset)
  end

  def update_prices(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    # Logger.debug(inspect(conn))
    real_estate = RealEstateContext.get!(id)

    case RealEstateContext.update_prices(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :edit_prices, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn = conn |> put_flash(:error, "Check following errors, please.")
        render(conn, "edit_prices.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def get_autocomplete_data(conn, :main_features) do
    property_type =
      KeyValueContext.html_select_values(conn, %{"set" => "property-types", "locale" => "pl_PL"})

    building_type =
      KeyValueContext.html_select_values(conn, %{"set" => "building-types", "locale" => "pl_PL"})

    kitchen_type =
      KeyValueContext.html_select_values(conn, %{"set" => "kitchen-types", "locale" => "pl_PL"})

    %{property_type: property_type, building_type: building_type, kitchen_type: kitchen_type}
  end

  def get_autocomplete_data(conn, :services) do
    heating_type =
      KeyValueContext.html_select_values(conn, %{"set" => "heating-types", "locale" => "pl_PL"})

    tv_set_type =
      KeyValueContext.html_select_values(conn, %{"set" => "tv-set-types", "locale" => "pl_PL"})

    %{heating_type: heating_type, tv_set_type: tv_set_type}
  end
end
