defmodule LikeThisMovie.Movies.Like do
  use Ecto.Schema
  import Ecto.Changeset

  alias LikeThisMovie.Movies.{Movie}
  alias LikeThisMovie.Accounts.{User}

  schema "likes" do
    belongs_to :user, User
    belongs_to :movie, Movie

    timestamps()
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [:user_id, :movie_id])
    |> validate_required([:user_id, :movie_id])
  end
end
