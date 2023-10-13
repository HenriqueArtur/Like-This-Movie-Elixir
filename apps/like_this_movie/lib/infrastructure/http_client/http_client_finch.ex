defmodule LikeThisMovie.HttpClientFinch do
  @moduledoc false

  @behaviour LikeThisMovie.HttpClient

  @impl true
  def get(url, headers \\ []) do
    url
    |> fetch(headers)
    |> response
    |> decode
  end

  # @doc false
  defp fetch(url, headers), do: Finch.build(:get, url, headers) |> Finch.request(LikeThisMovie.Finch)

  # @doc false
  defp response({:ok, %{status: 200, body: body}}), do: {:ok, body}
  defp response({:ok, %{status: status_code}}), do: {:error, %{reason: "HTTP Status '#{status_code}'"}}
  defp response({:error, _reason} = err), do: err

  @doc false
  defp decode({:error, %{body: body}}), do: {:error, %{reason: decode_error(body)}}
  defp decode({:error, _reason} = response), do: response
  defp decode({:ok, body}), do: {:ok, Jason.decode!(body)}

  @doc false
  defp decode_error(err) when is_bitstring(err), do: err
  defp decode_error(err), do: Jason.decode!(err)
end
