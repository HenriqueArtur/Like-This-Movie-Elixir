defmodule LikeThisMovieWeb.Components do

  def load_components do
    quote do
      import LikeThisMovieWeb.Center
      import LikeThisMovieWeb.ContentShell
      import LikeThisMovieWeb.Navigate
      import LikeThisMovieWeb.NavigateButton
      import LikeThisMovieWeb.Movie
    end
  end
end
