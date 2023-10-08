defmodule LikeThisMovieWeb.NavigateButton do
  use Phoenix.Component
  import LikeThisMovieWeb.CoreComponents

  def navigate_button(assigns) do
    ~H"""
    <.link
      navigate={@navigate}
      class="p-4 mt-2 rounded-md bg-white hover:bg-yellow-400 text-black"
    >
      <.icon name={@icon} class="mr-2" />
      <%= @label %>
    </.link>
    """
  end
end