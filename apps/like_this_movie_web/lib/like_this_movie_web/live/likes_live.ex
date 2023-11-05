defmodule LikeThisMovieWeb.LikesLive do
  use LikeThisMovieWeb, :live_view

  def render(assigns) do
    ~H"""
    <.content_shell page_title="Likes">
      <%= for {a_movie, index} <- @movies do %>
        <.movie
          id={a_movie.id}
          img={"#{LikeThisMovie.TMDB.url_img_from(a_movie.poster_path)}"}
          movie_title={a_movie.title}
          position={index + 1},
          likes={a_movie.likes}
          is_liked={a_movie.is_liked}
        />
      <% end %>
    </.content_shell>
    """
  end

  def mount(_params, _session, socket) do
    movies = LikeThisMovie.Movies.fetch_day_trend_movies(socket.assigns.current_user)
    {:ok, assign(socket, a_page: :page_likes, movies: movies)}
  end

  def handle_event("toggle-like", %{"position" => position}, socket) do
    movies = socket.assigns.movies
    user_id = socket.assigns.current_user.id
    new_movies = LikeThisMovieWeb.MoviesController.toggle_like(movies, user_id, position) |> IO.inspect()
    {:noreply, assign(socket, movies: new_movies)}
  end
end
