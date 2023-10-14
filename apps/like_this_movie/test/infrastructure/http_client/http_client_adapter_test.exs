defmodule LikeThisMovie.HttpClientAdapterTest do
  use ExUnit.Case
  use Patch

  test "should status code was 200" do
    patch(Finch, :request, {:ok, %{status: 200, headers: [], body: "{}"}})
    assert {:ok, %{}} == LikeThisMovie.HttpClientAdapter.get(LikeThisMovie.HttpClientFinch, "https://url.com")
  end

  test "should status code was NOT 200" do
    patch(Finch, :request, {:ok, %{status: 204, headers: [], body: "{}"}})
    assert {:error, %{reason: "HTTP Status '204'"}} == LikeThisMovie.HttpClientAdapter.get(LikeThisMovie.HttpClientFinch, "https://url.com")
  end

  test "should error" do
    patch(Finch, :request, {:error, %{status: 500, headers: [], body: "some error"}})
    assert {:error, %{reason: "some error"}} == LikeThisMovie.HttpClientAdapter.get(LikeThisMovie.HttpClientFinch, "https://url.com")
  end
end
