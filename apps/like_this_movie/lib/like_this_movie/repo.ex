defmodule LikeThisMovie.Repo do
  use Ecto.Repo,
    otp_app: :like_this_movie,
    adapter: Ecto.Adapters.Postgres
end
