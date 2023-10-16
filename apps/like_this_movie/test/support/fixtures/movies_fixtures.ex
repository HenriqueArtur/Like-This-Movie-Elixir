defmodule LikeThisMovie.MoviesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LikeThisMovie.Movies` context.
  """

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        title: "some title",
        original_title: "some original_title",
        backdrop_path: "some backdrop_path",
        poster_path: "some poster_path"
      })
      |> LikeThisMovie.Movies.create_movie()

    movie
  end
end
