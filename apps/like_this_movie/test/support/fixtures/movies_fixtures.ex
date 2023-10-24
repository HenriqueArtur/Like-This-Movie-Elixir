defmodule LikeThisMovie.MoviesFixtures do
  import LikeThisMovie.AccountsFixtures

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

  @doc """
  Generate a like.
  """
  @spec like_fixture({integer, integer}) :: %LikeThisMovie.Movies.Like{}
  def like_fixture(attrs \\ %{}) do
    user_id = get_a_user_id(attrs[:user_id] || nil)
    movie_id = get_a_movie_id(attrs[:movie_id] || nil)
    {:ok, like} = LikeThisMovie.Movies.add_like({user_id, movie_id})
    like
  end

  defp get_a_user_id(id), do: do_get_a_user_id(id)
  defp do_get_a_user_id(nil) do
    user = user_fixture()
    user.id
  end
  defp do_get_a_user_id(id), do: id

  defp get_a_movie_id(id), do: do_get_a_movie_id(id)
  defp do_get_a_movie_id(nil) do
    movie = movie_fixture()
    movie.id
  end
  defp do_get_a_movie_id(id), do: id
end
