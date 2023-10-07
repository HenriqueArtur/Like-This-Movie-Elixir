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

  # def mount(_params, _session, socket) do
  #   email = live_flash(socket.assigns.flash, :email)
  #   form = to_form(%{"email" => email}, as: "user")
  #   {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  # end
end
