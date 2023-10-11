defmodule LikeThisMovieWeb.NavigateButton do
  use Phoenix.Component
  import LikeThisMovieWeb.CoreComponents

  def navigate_button(assigns) do
    ~H"""
    <.link
      navigate={@navigate}
      class={"p-4 mt-2 rounded-md text-black #{a_class?(@is_active)}"}
    >
      <.icon name={if @is_active, do: @icon <> "-solid", else: @icon} class="mr-2" />
      <%= @label %>
    </.link>
    """
  end

  defp a_class?(true), do: "bg-yellow-400"
  defp a_class?(false), do: "bg-white hover:bg-yellow-400"
end