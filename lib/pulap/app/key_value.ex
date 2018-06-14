defmodule Pulap.App.KeyValue do
  @moduledoc false

  use Pulap.Schema
  import Ecto.Changeset
  alias Pulap.App.KeyValue
  alias Pulap.App.KeyValue.Context, as: Context
  require IEx

  schema "key_values" do
    field(:is_active, :boolean, default: false)
    field(:is_logical_deleted, :boolean, default: false)
    field(:key, :string)
    field(:key_group, :string)
    field(:key_subgroup, :string)
    field(:locale, :string)
    field(:position, :integer)
    field(:set, :string)
    field(:value, :string)
    field(:created_by_id, :id)
    field(:updated_by_id, :id)

    timestamps()
  end

  @doc false
  def changeset(%KeyValue{} = key_value, attrs) do
    key_value
    |> cast(attrs, [
      :set,
      :key,
      :value,
      :key_group,
      :key_subgroup,
      :locale,
      :position,
      :is_active,
      :is_logical_deleted
    ])
    |> validate_required([
      # :set,
      :key,
      :value
      # :key_group,
      # :key_subgroup,
      # :locale,
      # :position,
      # :is_active,
      # :is_logical_deleted
    ])
  end

  @doc false
  def update_changeset(%KeyValue{} = key_value, attrs) do
    key_value
    |> cast(attrs, [
      :set,
      :key,
      :value,
      :key_group,
      :key_subgroup,
      :locale,
      :position,
      :is_active,
      :is_logical_deleted
    ])
    |> validate_required([
      # :set,
      :key,
      :value
      # :key_group,
      # :key_subgroup,
      # :locale,
      # :position,
      # :is_active,
      # :is_logical_deleted
    ])
    |> validate_locale(:locale)
  end

  def validate_locale(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, locale ->
      to_lookup = Context.get_by_key(locale)
      cond do
        locale == nil || String.trim(locale) == "" || to_lookup ->
          []

        true ->
          [{field, options[:message] || "Must be a valid locale"}]
      end
    end)
  end
end
