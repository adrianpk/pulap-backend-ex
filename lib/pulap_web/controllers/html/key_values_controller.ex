defmodule PulapWeb.HTML.KeyValuesController do
  use PulapWeb, :controller

  # alias Pulap.Biz
  alias Pulap.App.KeyValue.Context, as: KeyValueContext
  alias Pulap.App.KeyValue
  alias PulapWeb.Auth.Helpers
  require Logger
  require IEx

  def index(conn, _params) do
    key_values = KeyValueContext.list()
    render(conn, "index.html", key_values: key_values, set: nil)
  end

  def set_index(conn, %{}) do
    set = conn |> set_from_params
    key_values = set |> KeyValueContext.list_set_by_locale("pl")
    render(conn, "index.html", key_values: key_values, set: set)
  end

  def new(conn, _params) do
    changeset = KeyValueContext.change(%KeyValue{})
    autocomplete_data = get_autocomplete_data(conn)
    render(conn, "new.html", changeset: changeset, autocomplete_data: autocomplete_data)
  end

  def create(conn, %{"key_value" => key_value_params}) do
    set = conn |> set_from_params
    autocomplete_data = get_autocomplete_data(conn)

    case KeyValueContext.create(key_value_params) do
      {:ok, key_value} ->
        conn
        |> put_flash(:info, "Key value created successfully.")
        |> redirect(to: key_values_path(conn, :edit, key_value))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn = conn |> put_flash(:error, "Check following errors, please.")
        render(conn, "new.html", changeset: changeset, autocomplete_data: autocomplete_data)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   key_value = KeyValueContext.get!(id)
  #   render(conn, "show.html", key_value: key_value)
  # end

  def edit(conn, %{"id" => id}) do
    key_value = KeyValueContext.get!(id)
    changeset = KeyValueContext.change(key_value)
    autocomplete_data = get_autocomplete_data(conn)

    render(
      conn,
      "edit.html",
      key_value: key_value,
      changeset: changeset,
      set: key_value.set,
      autocomplete_data: autocomplete_data
    )
  end

  def update(conn, %{"id" => id, "key_value" => key_value_params}) do
    key_value = KeyValueContext.get!(id)
    autocomplete_data = get_autocomplete_data(conn)

    case KeyValueContext.update(key_value, key_value_params) do
      {:ok, key_value} ->
        conn
        |> put_flash(:info, "Key value updated successfully.")
        |> redirect(to: key_values_path(conn, :edit, key_value))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn = conn |> put_flash(:error, "Check following errors, please.")
        render(conn, "edit.html", key_value: key_value, changeset: changeset, set: key_value.set, autocomplete_data: autocomplete_data
    )
    end
  end

  def show_confirm_delete(conn, %{"id" => id}) do
    key_value = KeyValueContext.get!(id)
    changeset = KeyValueContext.change(key_value)
    render(conn, "confirm_delete.html", key_value: key_value, changeset: changeset)
  end


  def delete(conn, %{"id" => id}) do
    key_value = KeyValueContext.get!(id)
    {:ok, _key_value} = KeyValueContext.delete(key_value)

    conn
    |> put_flash(:info, "Real estate deleted successfully.")
    |> redirect(to: key_values_path(conn, :index))
  end

  def get_autocomplete_data(conn) do
    sets = KeyValueContext.sets_data_list_string(conn)
    groups = KeyValueContext.groups_data_list_string(conn)
    subgroups = KeyValueContext.subgroups_data_list_string(conn)

    locales =
      KeyValueContext.keys_data_list_string(conn, %{"set" => "locales", "locale" => "en_US"})

    %{sets: sets, groups: groups, subgroups: subgroups, locales: locales}
  end
end
