defmodule LikeThisMovie.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  alias LikeThisMovie.Accounts.{User}
  alias LikeThisMovie.Movies.{Like}

  schema "movies" do
    field :title, :string
    field :original_title, :string
    field :backdrop_path, :string
    field :poster_path, :string
    many_to_many(
      :likes,
      User,
      join_through: Like,
      on_replace: :delete
      # join_keys: [user_id: :id, movie_id: :id]
    )
    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :original_title, :backdrop_path, :poster_path])
    |> validate_required([:title, :original_title, :backdrop_path, :poster_path])
  end
end
