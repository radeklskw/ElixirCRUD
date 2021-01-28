defmodule ComputerService.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ComputerService.Repo,
      # Start the Telemetry supervisor
      ComputerServiceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ComputerService.PubSub},
      # Start the Endpoint (http/https)
      ComputerServiceWeb.Endpoint
      # Start a worker by calling: ComputerService.Worker.start_link(arg)
      # {ComputerService.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ComputerService.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ComputerServiceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
