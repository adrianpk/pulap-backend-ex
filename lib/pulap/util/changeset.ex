defmodule Pulap.Util.Changeset do
  @moduledoc """
  Utility functions for changesets.
  """

  def is_new?(changeset) do
    Ecto.get_meta(changeset.data, :state) == :built
  end
end
