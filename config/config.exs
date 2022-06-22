# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bookchain,
  ecto_repos: [Bookchain.Repo]

# Configures the endpoint
config :bookchain, BookchainWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vLCky1fRZskQy5h2VNkZKSw1XGEYoBJKBdDGSA3XO/amfYac+h+YtflVCH0qszR4",
  render_errors: [view: BookchainWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bookchain.PubSub,
  live_view: [signing_salt: "EB2lJpml"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
