defmodule PulapWeb.HTML.SessionController do

  use PulapWeb, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case PulapWeb.HTML.AuthPlug.sign_in_with_username_and_password(conn, username, password, repo: Pulap.Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: dashboard_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination.")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> PulapWeb.HTML.AuthPlug.sign_out()
    |> redirect(to: session_path(conn, :new))
  end
end
