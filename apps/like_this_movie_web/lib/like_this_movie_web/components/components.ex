defmodule LikeThisMovieWeb.Components do

  def load_components do
    quote do
      import LikeThisMovieWeb.ContentShell
      import LikeThisMovieWeb.Navigate
      import LikeThisMovieWeb.NavigateButton
    end
  end
end