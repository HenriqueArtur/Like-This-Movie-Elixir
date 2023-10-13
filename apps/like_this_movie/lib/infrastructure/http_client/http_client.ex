defmodule LikeThisMovie.HttpClient do
  @moduledoc false

  @typep url :: binary()
  @typep headers :: [{header_name :: String.t(), header_value :: String.t()}]
  @typep response :: {:ok, map()} | {:error, binary() | map()}

  @callback get(url, headers) :: response
end
