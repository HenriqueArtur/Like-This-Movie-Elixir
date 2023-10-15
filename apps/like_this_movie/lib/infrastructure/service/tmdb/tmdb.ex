defmodule LikeThisMovie.TMDB do
  @moduledoc false

  @http_client Application.compile_env(:like_this_movie, :http_client)
  @tmdb_url "https://api.themoviedb.org/3"
  @tmdb_url_img "https://image.tmdb.org/t/p/w500"
  @tmdb_token Application.compile_env(:like_this_movie, :tmdb_token)

  def trending("day"), do: do_trending("day")
  def trending("week"), do: do_trending("week")
  def trending(time_window, lang \\ "en-US"), do: do_trending(time_window, lang)

  defp do_trending(time_window, lang \\ "en-US") do
    mount_url(time_window, lang)
    |> request_movies
    |> extract_results
  end

  defp mount_url(time_window, lang), do: @tmdb_url <> "/trending/movie/#{time_window}?language=#{lang}"
  defp request_movies(url), do: @http_client.get(url, [
      {"accept", "application/json"},
      {"Authorization", "Bearer #{@tmdb_token}"}
    ])

  defp extract_results({:ok, %{"results" => results}}), do: results
  defp extract_results({:error, _} = err), do: err

  def url_img, do: @tmdb_url_img
end
