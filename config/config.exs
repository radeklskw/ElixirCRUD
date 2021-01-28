# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :computer_service,
  ecto_repos: [ComputerService.Repo]

# Configures the endpoint
config :computer_service, ComputerServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AkBtPXoBTnW4ch4fvWCXSu6OMrYJzk+L0h618ujcs3O29kpoACZqzWTl1uHTCVfB",
  render_errors: [view: ComputerServiceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ComputerService.PubSub,
  live_view: [signing_salt: "cRwDPCD+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
