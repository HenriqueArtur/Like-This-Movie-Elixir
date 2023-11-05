defmodule LikeThisMovieWeb.Movie do
  use Phoenix.Component
  import LikeThisMovieWeb.CoreComponents

  def movie(assigns) do
    ~H"""
    <article id={"movie-#{@id}"} class="w-44 rounded-lg shadow-lg ring-1 ring-gray-900/5 m-2">
      <div class="relative">
        <button
          class={"rounded-full absolute p-2 right-3 top-3 #{a_like_btn_class?(@is_liked)}"}
          phx-value-position={@position - 1}
          phx-click="toggle-like">
          <.icon name={if @is_liked, do: "material-favorite-solid", else: "material-favorite"} />
        </button>
        <img
          class="rounded-t-lg"
          src={@img}
          alt={"Poster from #{@movie_title}"}>
        <div class="absolute -bottom-2 ml-2">
          <span class="bg-yellow-400 rounded p-1">#<%= @position %></span>
        </div>
      </div>
      <div class="flex flex-col px-4 py-4">
          <h3 class="font-semibold text-ellipsis overflow-hidden leading-5 h-16"><%= @movie_title %></h3>
          <div class="mt-2 text-white font-medium">
            <span class="bg-purple-600 rounded p-1 px-2">
              Likes: <%= @likes %>
            </span>
          </div>
      </div>
    </article>
    """
  end

  defp a_like_btn_class?(true), do: "text-black bg-yellow-400"
  defp a_like_btn_class?(false), do: "text-white bg-purple-600"
end
