defmodule PulapWeb.HTML.Managed.RealEstateController do
  use PulapWeb, :controller

  alias Pulap.Biz
  alias Pulap.Biz.RealEstate
  alias PulapWeb.Auth.Helpers

  def index(conn, _params) do
    context =
      case Helpers.get_context(conn) do
        %{user: user} ->
          user |> Repo.preload(:managed_real_estate)

        %{organization: organization} ->
          organization |> Repo.preload(:managed_real_estate)
      end

    render(conn, "index.html", real_estate: context.managed_real_estate())
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

  def edit_step_two(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    changeset = Biz.change_real_estate(real_estate)
    render(conn, "edit_step_two.html", real_estate: real_estate, changeset: changeset)
  end

  def update_step_two(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = Biz.get_real_estate!(id)

    case Biz.update_real_estate(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_step_two.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_step_three(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    changeset = Biz.change_real_estate(real_estate)
    render(conn, "edit_step_three.html", real_estate: real_estate, changeset: changeset)
  end

  def update_step_three(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = Biz.get_real_estate!(id)

    case Biz.update_real_estate(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_step_three.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_step_four(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    changeset = Biz.change_real_estate(real_estate)
    render(conn, "edit_step_four.html", real_estate: real_estate, changeset: changeset)
  end

  def update_step_four(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = Biz.get_real_estate!(id)

    case Biz.update_real_estate(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_step_four.html", real_estate: real_estate, changeset: changeset)
    end
  end

  def edit_step_five(conn, %{"id" => id}) do
    real_estate = Biz.get_real_estate!(id)
    changeset = Biz.change_real_estate(real_estate)
    render(conn, "edit_step_five.html", real_estate: real_estate, changeset: changeset)
  end

  def update_step_five(conn, %{"id" => id, "real_estate" => real_estate_params}) do
    real_estate = Biz.get_real_estate!(id)

    case Biz.update_real_estate(real_estate, real_estate_params) do
      {:ok, real_estate} ->
        conn
        |> put_flash(:info, "Real estate updated successfully.")
        |> redirect(to: real_estate_path(conn, :show, real_estate))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit_step_five.html", real_estate: real_estate, changeset: changeset)
    end
  end
end
