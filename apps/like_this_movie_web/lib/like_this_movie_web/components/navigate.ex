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
        <div :if={@current_user} class="flex flex-col">
          <.navigate_button
            navigate="/likes"
            label="Likes"
            icon={if @a_page == :page_likes, do: "material-favorite-solid", else: "material-favorite"}
            is_active={@a_page == :page_likes} />
          <.navigate_button
            navigate="/trending"
            label="Trending"
            icon={if @a_page == :page_trending, do: "material-trending_up-solid", else: "material-trending_up"}
            is_active={@a_page == :page_trending} />
        </div>
      </div>
      <div :if={@current_user} class="flex flex-col">
        <.navigate_button
          navigate="/users/settings"
          label="Profile"
          icon={if @a_page == :page_profile, do: "material-account_circle-solid", else: "material-account_circle"}
          is_active={@a_page == :page_profile} />
        <.link
          href="/users/log_out"
          method="delete"
          class="p-4 mt-2 rounded-md bg-white hover:bg-yellow-400"
        >
          <.icon name="material-logout" class="mr-2" />
          Log out
        </.link>
      </div>
    </div>
    """
  end
end