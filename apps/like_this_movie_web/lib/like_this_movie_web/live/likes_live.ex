defmodule LikeThisMovieWeb.LikesLive do
  use LikeThisMovieWeb, :live_view

  def render(assigns) do
    ~H"""
    <.content_shell page_title="Likes">
      <%= for {a_movie, index} <- @movies do %>
        <.movie
          img={"#{LikeThisMovie.TMDB.url_img_from(a_movie.poster_path)}"}
          movie_title={a_movie.title}
          position={index + 1},
          likes={a_movie.likes}
          is_liked={false}
        />
      <% end %>
    </.content_shell>
    """
  end

  def mount(_params, _session, socket) do
    movies = LikeThisMovie.Movies.fetch_day_trend_movies
    {:ok, assign(socket, a_page: :page_likes, movies: movies)}
  end
end
