defmodule LikeThisMovieWeb.Center do
  use Phoenix.Component

  slot :inner_block, required: true

  def center(assigns) do
    ~H"""
    <div class="h-full flex flex-col justify-center">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end