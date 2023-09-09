defmodule LikeThisMovie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LikeThisMovie.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LikeThisMovie.PubSub},
      # Start Finch
      {Finch, name: LikeThisMovie.Finch}
      # Start a worker by calling: LikeThisMovie.Worker.start_link(arg)
      # {LikeThisMovie.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: LikeThisMovie.Supervisor)
  end
end
