defmodule PulapWeb.HTML.RealEstateController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.RealEstate

  plug :authenticate when action in [:index]

  require Logger
  def index(conn, _params) do
    # Obtener el usuario de la session
    user = conn.assigns.current_user()
    Logger.debug(user.id)
    # Buscar todos las propiedades del usuario
    # Ordenar cronologicamente
    real_estate = Biz.list_real_estates()
    render(conn, "index.html", real_estate: real_estate)
  end

  def new(conn, _params) do
    changeset = Biz.change_real_estate(%RealEstate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"real_estate" => real_estate_params}) do
    case Biz.create_real_estate(real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate created successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    render(conn, "show.html", real_estate: real_estate)
  end

  def edit(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    changeset = Biz.change_real_estate(real_estate)
    render(conn, "edit.html", real_estate: real_estate, changeset: changeset)
  end

  def update(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = Biz.get_real_estate!(id)

    case Biz.update_real_estate(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    {:ok, _real_estate} = Biz.delete_real_estate(real_estate)

    conn
    |> put_flash(:info, "Real estate deleted successfully.")
    |> redirect(to: real_estate_path(conn, :index))
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user() do
      conn
    else
      conn
      |> put_flash(:error, "You must be signed in to access that page.")
      |> redirect(to: session_path(conn, :new))
      |> halt()
    end
  end
end
