defmodule LikeThisMovie.MoviesTest do
  use LikeThisMovie.DataCase, async: true

  alias LikeThisMovie.Movies

  describe "movies" do
    alias LikeThisMovie.Movies.Movie

    import LikeThisMovie.MoviesFixtures

    @invalid_attrs %{title: nil, original_title: nil, backdrop_path: nil, poster_path: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Movies.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Movies.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{title: "some title", original_title: "some original_title", backdrop_path: "some backdrop_path", poster_path: "some poster_path"}

      assert {:ok, %Movie{} = movie} = Movies.create_movie(valid_attrs)
      assert movie.title == "some title"
      assert movie.original_title == "some original_title"
      assert movie.backdrop_path == "some backdrop_path"
      assert movie.poster_path == "some poster_path"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movies.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{title: "some updated title", original_title: "some updated original_title", backdrop_path: "some updated backdrop_path", poster_path: "some updated poster_path"}

      assert {:ok, %Movie{} = movie} = Movies.update_movie(movie, update_attrs)
      assert movie.title == "some updated title"
      assert movie.original_title == "some updated original_title"
      assert movie.backdrop_path == "some updated backdrop_path"
      assert movie.poster_path == "some updated poster_path"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Movies.update_movie(movie, @invalid_attrs)
      assert movie == Movies.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Movies.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Movies.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Movies.change_movie(movie)
    end
  end

  describe "likes" do
    import LikeThisMovie.MoviesFixtures
    import LikeThisMovie.AccountsFixtures
    alias LikeThisMovie.Movies.{Like}

    test "add_like/1 with valid user and movie" do
      %{id: user_id} = user_fixture()
      %{id: movie_id} = movie_fixture()
      assert {:ok, %Like{}} = Movies.add_like({user_id, movie_id})
    end

    test "add_like/1 with invalid user" do
      %{id: movie_id} = movie_fixture()
      assert_raise Ecto.InvalidChangesetError, fn -> Movies.add_like({0, movie_id}) end
    end

    test "add_like/1 with invalid movie" do
      %{id: user_id} = user_fixture()
      assert_raise Ecto.InvalidChangesetError, fn -> Movies.add_like({user_id, 0}) end
    end
  end
end
