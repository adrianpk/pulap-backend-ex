defmodule PulapWeb.HTML.UserController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.User

  require Logger

  def init_signup(conn, _params) do
    changeset = Auth.change_user(%User{})
    render(conn, "signup.html", changeset: changeset)
  end

  def signup(conn, %{"user" => user_params}) do
    case Auth.sign_up_user(user_params) do
      {:ok, user} ->
        conn
        |> PulapWeb.Auth.Helpers.sign_in(user)
        |> put_flash(:info, "User signed up successfully.")
        |> redirect(to: user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(conn, _params) do
    users = Auth.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Auth.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Auth.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    changeset = Auth.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Auth.get_user!(id)

    case Auth.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    {:ok, _user} = Auth.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
