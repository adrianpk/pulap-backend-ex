use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pulap, PulapWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Reduce bcrypt rounds to speed up tests
config :bcrypt_elixir, :log_rounds, 4

# Configure your database
config :pulap, Pulap.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "adrian",
  password: "anpok",
  database: "pulap_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  # pool_size: 10,
  extensions: [{Geo.PostGIS.Extension, library: Geo}],
  types: Pulap.PostgresTypes
