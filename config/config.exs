# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kefis,
  ecto_repos: [Kefis.Repo]
  config :kefis, Kefis.Repo,
  migration_timestamps: [type: :utc_datetime_usec]

# Configures the endpoint
config :kefis, KefisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IhB21DPvhDehOk30FBKjlNKN3snm+036bxpV3D7iaOtMpJamRutvZoMHumuD2vpu",
  render_errors: [view: KefisWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Kefis.PubSub,
  live_view: [signing_salt: "ShaLKMSC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
