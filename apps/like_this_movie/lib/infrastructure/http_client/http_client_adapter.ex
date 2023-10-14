defmodule LikeThisMovie.HttpClientAdapter do
  @moduledoc false

  @type url :: binary()
  @type headers :: [{header_name :: String.t(), header_value :: String.t()}] | []
  @type response :: {:ok, map()} | {:error, binary() | map()}

  @spec get(module(), url, headers) :: response
  def get(a_func, url, headers \\ []), do: a_func.get(url, headers)
end
