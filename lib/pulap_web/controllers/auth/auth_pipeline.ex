defmodule PulapWeb.Auth.AuthPipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline, otp_app: :pulap

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
