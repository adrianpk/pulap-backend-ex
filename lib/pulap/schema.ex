defmodule Pulap.Schema do
  @moduledoc """
  Customized Schema for easy use of UUID type IDs.
  """

  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      @primary_key {:id, Ecto.UUID, autogenerate: true}
      @foreign_key_type Ecto.UUID
      @derive {Phoenix.Param, key: :id}
    end
  end
end
