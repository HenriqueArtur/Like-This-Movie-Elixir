defmodule LikeThisMovieWeb.TrendingLive do
  use LikeThisMovieWeb, :live_view

  def render(assigns) do
    ~H"""
    <.content_shell page_title="Trending">
      Trending
    </.content_shell>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, a_page: :page_trending)}
  end
end
