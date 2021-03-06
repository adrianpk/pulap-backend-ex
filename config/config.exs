# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pulap,
  ecto_repos: [Pulap.Repo],
  migration_primary_key: [id: :uuid, type: :binary_id],
  migration_timestamps: [type: :timestamptz]

# Configures the endpoint
config :pulap, PulapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m9uqsV6bdp/d+K6WnLPIm8IDlInT/a09WL7zqUZkqpVxpoq0UWa0QKpiKRR7IQk+",
  render_errors: [view: PulapWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pulap.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian
config :pulap, PulapWeb.Auth.Guardian,
  issuer: "pulap",
  secret_key: "AXFFDuAZk/CSDwycPnmgpo6F44lmnCIdJZgg36fYsk0qrrRcXul8okH5dYyYZ5xm"

config :pulap, PulapWeb.Auth.AuthPipeline,
  module: PulapWeb.Auth.Guardian,
  error_handler: PulapWeb.Auth.ErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
