defmodule Wishlist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Wishlist.Repo,
      # Start the Telemetry supervisor
      WishlistWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wishlist.PubSub},
      # Start the Endpoint (http/https)
      WishlistWeb.Endpoint
      # Start a worker by calling: Wishlist.Worker.start_link(arg)
      # {Wishlist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wishlist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WishlistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
