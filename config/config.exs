# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wishlist,
  ecto_repos: [Wishlist.Repo]

# Configures the endpoint
config :wishlist, WishlistWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2ODbM3Qb0M94VAht9hxNZHqZ+rWiASJJLHVswAcO7RD05Znocl/5m8F4oWvdBUM8",
  render_errors: [view: WishlistWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Wishlist.PubSub,
  live_view: [signing_salt: "36zVaoMr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
