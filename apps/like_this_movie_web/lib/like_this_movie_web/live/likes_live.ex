defmodule LikeThisMovieWeb.LikesLive do
  use LikeThisMovieWeb, :live_view

  def render(assigns) do
    ~H"""
    <.content_shell page_title="Likes">
      Likes
    </.content_shell>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, a_page: :page_likes)}
  end
end
