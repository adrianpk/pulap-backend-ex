defmodule PulapWeb.Auth.Helpers do
  @moduledoc """
  Signin, signout and context related functions.

  ## Examples

  iex> PulapWeb.Auth.Helpers.set_context(conn, user, supplied_context_id)
  "44edcec8-25a8-49b5-a789-ec90883884ac"

  """

  import Plug.Conn
  alias Pulap.Auth
  alias Pulap.Repo
  require Logger

  def sign_in_with_username_and_password(conn, username, given_password, opts) do
    Logger.debug(inspect(opts))
    user = Auth.get_user_by_username(username)

    cond do
      user && Comeonin.Bcrypt.checkpw(given_password, user.password_hash) ->
        {:ok, sign_in(conn, user)}

      user ->
        {:error, :unauthorized, conn}

      true ->
        Comeonin.Bcrypt.dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def sign_in(conn, user) do
    conn
    |> set_login_context(user)
  end

  def sign_out(conn) do
    conn
    |> PulapWeb.Auth.Guardian.Plug.sign_out()
    |> configure_session(drop: true)
  end

  def set_login_context(conn, user) do
    conn =
      case user.context_id do
        nil ->
          conn
          |> set_context(user, user.id)

        "" ->
          conn
          |> set_context(user, user.id)

        context_id ->
          conn
          |> set_context(user, context_id)
      end

    conn
  end

  def set_context(conn, user, supplied_context_id) do
    # FIX: Logic is Ok but needs to be coded in a more functional way
    # User user_id == supplied_context_id?
    # - Work as Personal account. No organization
    # - Remove organization from session and connection
    context_id =
      case user.id == supplied_context_id do
        true ->
          # Do nothing, org is nil
          user.id

        false ->
          # - Search in user_role with:
          # - user_id = user.id, organization_id = supplied_context_id
          case user.has_role_in_organization(supplied_context_id) do
            # -- found?
            # --- new_context_id = passed_context_id
            true ->
              supplied_context_id

            # -- not found? (This shouldn't happen, often at least)
            # -- new_context_id = user.id
            false ->
              # Do nothing, org is nil
              user.id
          end
      end

    user = user |> store_user_context(context_id)

    conn =
      conn
      |> PulapWeb.Auth.Guardian.Plug.sign_in(user)
      |> assign(:current_user, user)
      # |> put_session(:current_user_id, user.id)
      |> assign(:context_id, user.context_id)

    # |> put_session(:context_id, user.context_id)
    # |> configure_session(renew: true)
    conn
  end

  defp store_user_context(user, context_id) do
    case Auth.update_user_context(user, %{context_id: context_id}) do
      {:ok, updated_user} ->
        updated_user

      {:error, %Ecto.Changeset{}} ->
        user
    end
  end

  def user_from_session(conn) do
    user = PulapWeb.Auth.Guardian.Plug.current_resource(conn)
    Auth.get_user!(user.id)
  end

  def user_from_session(conn, :include_profile) do
    conn
    |> user_from_session
    |> Repo.preload(:profile)
  end

  def user_from_params(conn) do
    user_id = conn.params["user_id"]
    Auth.get_user!(user_id)
  end

  def profile_from_user(user) do
    query = Ecto.assoc(user, :profile)
    Repo.one(query)
  end

  def get_context(conn) do
    user = user_from_session(conn)

    case user.id == user.context_id do
      true ->
        %{user: user}

      false ->
        organization = Auth.get_organization!(user.context_id)
        %{organization: organization}
    end
  end
end
