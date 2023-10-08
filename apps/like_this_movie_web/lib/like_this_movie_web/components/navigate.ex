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
            <.navigate_button navigate="/likes" label="Likes" icon={"material-favorite"} />
            <.navigate_button navigate="/trending" label="Trending" icon={"material-trending_up"} />
          </div>
        <% end %>
      </div>
      <%= if @current_user != nil do %>
        <div class="flex flex-col">
          <.navigate_button navigate="/users/settings" label="Profile" icon={"material-account_circle"} />
          <.link
            href="/users/log_out"
            method="delete"
            class="p-4 mt-2 rounded-md bg-white hover:bg-yellow-400"
          >
            <.icon name="material-logout" class="mr-2" />
            Log out
          </.link>
        </div>
      <% end %>
    </div>
    """
  end
end