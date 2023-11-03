defmodule LikeThisMovieWeb.LikesLive do
  use LikeThisMovieWeb, :live_view

  def render(assigns) do
    ~H"""
    <.content_shell page_title="Likes">
      <%= for _ <- 1..10 do %>
        <.movie
          img="https://image.tmdb.org/t/p/w500/yqnNLn24shYnZ6kqGpbwuB3NJ0D.jpg"
          movie_title="A big name, too biiiiigggggggggggg lorem saassasasasas dsdsds"
          position="10",
          likes="999"
          is_liked={false}
        />
      <% end %>
    </.content_shell>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, a_page: :page_likes)}
  end
end
