defmodule LikeThisMovie.TMDBTest do
  use ExUnit.Case
  use Patch

  @http_client Application.compile_env(:like_this_movie, :http_client)

  test "service online and auth" do
    movies = [
      LikeThisMovie.Mock.TMDB.build,
      LikeThisMovie.Mock.TMDB.build,
    ]
    body = %{
      "page" => 1,
      "results" => movies,
      "total_pages" => 1000,
      "total_results" => 20000
    }
    patch(@http_client, :get, {:ok, body})
    assert movies == LikeThisMovie.TMDB.trending("day")
  end

  test "service online and NOT auth" do
    patch(@http_client, :get, {:error, %{reason: "HTTP Status '204'"}})
    assert {:error, %{reason: "HTTP Status '204'"}} == LikeThisMovie.TMDB.trending("day")
  end

  test "some error on service" do
    patch(@http_client, :get, {:error, %{reason: "some error"}})
    assert {:error, %{reason: "some error"}} == LikeThisMovie.TMDB.trending("day")
  end
end
