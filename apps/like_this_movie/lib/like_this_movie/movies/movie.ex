defmodule LikeThisMovie.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :title, :string
    field :original_title, :string
    field :backdrop_path, :string
    field :poster_path, :string

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :original_title, :backdrop_path, :poster_path])
    |> validate_required([:title, :original_title, :backdrop_path, :poster_path])
  end
end
