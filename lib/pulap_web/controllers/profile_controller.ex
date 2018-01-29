defmodule PulapWeb.ProfileController do
  use PulapWeb, :controller

  alias Pulap.Auth
  alias Pulap.Auth.Profile

  action_fallback PulapWeb.FallbackController

  def index(conn, _params) do
    profiles = Auth.list_profiles()
    render(conn, "index.json", profiles: profiles)
  end

  def create(conn, %{"profile" => profile_params}) do
    user = conn |> user_from_session(:include_profile)
    with {:ok, %Profile{} = profile} <- Auth.create_profile(profile_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_profile_path(conn, :show, user, profile))
      |> render("show.json", profile: profile)
    end
  end

  def show(conn, %{"id" => id}) do
    profile = Auth.get_profile!(id)
    render(conn, "show.json", profile: profile)
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    profile = Auth.get_profile!(id)

    with {:ok, %Profile{} = profile} <- Auth.update_profile(profile, profile_params) do
      render(conn, "show.json", profile: profile)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile = Auth.get_profile!(id)
    with {:ok, %Profile{}} <- Auth.delete_profile(profile) do
      send_resp(conn, :no_content, "")
    end
  end
end
