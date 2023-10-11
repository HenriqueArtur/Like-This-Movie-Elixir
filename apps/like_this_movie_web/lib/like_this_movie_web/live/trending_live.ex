defmodule LikeThisMovieWeb.TrendingLive do
  use LikeThisMovieWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        trending
      </.header>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, a_page: :page_trending)}
  end
end
