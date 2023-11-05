defmodule LikeThisMovieWeb.MoviesController do

  def toggle_like(movies, user_id, position) do
    movies
    |> get_a_selected_movie(position)
    |> update_selected_movie(user_id)
    |> update_movies(movies)
  end

  defp get_a_selected_movie(movies, position) do
    { position_parsed, _ } = Integer.parse(position)
    { movie_selected, pos } = Enum.at(movies, position_parsed)
    { movie_selected, pos }
  end

  defp update_selected_movie({ movie_selected, pos }, user_id ) do
    is_liked_old = movie_selected.is_liked
    update_like_db(is_liked_old, { user_id, movie_selected.id })
    likes_op = if is_liked_old do -1 else 1 end
    movie_updated =
      Map.put(movie_selected, :is_liked, !is_liked_old)
      |> Map.put(:likes, movie_selected.likes + likes_op)
    { movie_updated, pos }
  end

  defp update_like_db(is_like_old, like) do
    if is_like_old do
      LikeThisMovie.Movies.remove_like(like)
    else
      LikeThisMovie.Movies.add_like(like)
    end
  end

  defp update_movies({ _movie_updated, pos } = updated_movie, movies) do
    movies
    |> Enum.map(
      fn
        { _, ^pos } -> updated_movie
        other -> other
      end)
  end
end
