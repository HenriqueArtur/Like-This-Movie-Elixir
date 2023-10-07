defmodule LikeThisMovieWeb.Navigate do
  use Phoenix.Component
  import LikeThisMovieWeb.CoreComponents
  import LikeThisMovieWeb.NavigateButton

  def navigate(assigns) do
    ~H"""
    <div class="p-8 bg-purple-600 w-80 h-screen flex flex-col justify-between">
      <div>
        <header class="mb-2">
          <h1 class="text-white text-5xl">like this movie</h1>
        </header>
        <%= if @current_user != nil do %>
          <div class="flex flex-col">
            <.navigate_button navigate="/likes" label="Likes"/>
            <.navigate_button navigate="/trending" label="Trending"/>
          </div>
        <% else %>
        <% end %>
      </div>
      <%= if @current_user != nil do %>
        <div class="flex flex-col">
          <.navigate_button navigate="/users/settings" label="Profile"/>
          <.link
            href="/users/log_out"
            method="delete"
            class="p-4 mt-2 rounded-md bg-white hover:bg-yellow-500"
          >
            <.icon name="material-favorite" class="mr-2" />
            Log out
          </.link>
        </div>
      <% else %>
      <% end %>
    </div>
    """
  end
end