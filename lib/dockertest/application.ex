defmodule Dockertest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Dockertest.Worker

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Worker
      # Starts a worker by calling: Dockertest.Worker.start_link(arg)
      # {Dockertest.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dockertest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
