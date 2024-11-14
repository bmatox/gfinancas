defmodule Gfinancas.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GfinancasWeb.Telemetry,
      Gfinancas.Repo,
      {DNSCluster, query: Application.get_env(:gfinancas, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Gfinancas.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Gfinancas.Finch},
      # Start a worker by calling: Gfinancas.Worker.start_link(arg)
      # {Gfinancas.Worker, arg},
      # Start to serve requests, typically the last entry
      GfinancasWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gfinancas.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GfinancasWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
