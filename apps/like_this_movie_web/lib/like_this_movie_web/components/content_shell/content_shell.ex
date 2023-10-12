defmodule LikeThisMovieWeb.ContentShell do
  use Phoenix.Component

  attr :page_title, :string, default: nil

  slot :inner_block, required: true

  def content_shell(assigns) do
    ~H"""
    <h1><%= @page_title %></h1>
    <%= render_slot(@inner_block) %>
    """
  end
end