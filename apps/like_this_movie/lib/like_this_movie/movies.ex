defmodule LikeThisMovie.Movies do
  @moduledoc """
  The Movies context.
  """

  import Ecto.Query, warn: false
  alias LikeThisMovie.Repo

  alias LikeThisMovie.Movies.Movie
  alias LikeThisMovie.Movies.{Like}

  @doc """
  Returns the list of movies.

  ## Examples

      iex> list_movies()
      [%Movie{}, ...]

  """
  def list_movies do
    Repo.all(Movie)
  end

  @doc """
  Gets a single movie.

  Raises `Ecto.NoResultsError` if the Movie does not exist.

  ## Examples

      iex> get_movie!(123)
      %Movie{}

      iex> get_movie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_movie!(id), do: Repo.get!(Movie, id)
  def get_movie(id), do: Repo.get(Movie, id)

  @doc """
  Creates a movie.

  ## Examples

      iex> create_movie(%{field: value})
      {:ok, %Movie{}}

      iex> create_movie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_movie(attrs \\ %{}) do
    %Movie{}
    |> Movie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movie.

  ## Examples

      iex> update_movie(movie, %{field: new_value})
      {:ok, %Movie{}}

      iex> update_movie(movie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_movie(%Movie{} = movie, attrs) do
    movie
    |> Movie.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a movie.

  ## Examples

      iex> delete_movie(movie)
      {:ok, %Movie{}}

      iex> delete_movie(movie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_movie(%Movie{} = movie) do
    Repo.delete(movie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movie changes.

  ## Examples

      iex> change_movie(movie)
      %Ecto.Changeset{data: %Movie{}}

  """
  def change_movie(%Movie{} = movie, attrs \\ %{}) do
    Movie.changeset(movie, attrs)
  end

  @doc """
  Creates a like.
  """
  def add_like({user_id, movie_id}) do
    like = %Like{}
      |> Like.changeset(%{user_id: user_id, movie_id: movie_id})
      |> Repo.insert!()
    {:ok, like}
  end

  @doc """
  Deletes a like
  """
  def remove_like({user_id, movie_id}) do
    Repo.get_by!(Like, [user_id: user_id, movie_id: movie_id])
    |> Repo.delete
  end

  def fetch_day_trend_movies() do
    movies = LikeThisMovie.TMDB.trending("day")
    |> Enum.take(10)

    ids = movies
    |> Enum.map(fn movie-> movie["id"] end)

    query =
      from m in Movie,
        left_join: likes in Like,
        on: m.id == likes.movie_id,
        where: m.tmdb_id in ^ids,
        select: %{
          id: m.id,
          title: m.title,
          original_title: m.original_title,
          backdrop_path: m.backdrop_path,
          poster_path: m.poster_path,
          tmdb_id: m.tmdb_id,
          likes: count(likes.movie_id)
        },
        group_by: [m.id, m.title, m.original_title, m.backdrop_path, m.poster_path, m.tmdb_id]

    Repo.all(query)
    |> get_or_create(movies)
    |> Enum.with_index
  end

  defp get_or_create(from_app, from_tmdb) do
    from_tmdb
    |> Enum.map(fn tmdb_movie ->
        exist_in_app = Enum.find(from_app,
          fn an_app_movie ->
            tmdb_movie["id"] == an_app_movie.tmdb_id
          end)
        if exist_in_app do
          exist_in_app
        else
          create_movie_from_tmdb(tmdb_movie)
        end
      end)
  end

  defp create_movie_from_tmdb(movie) do
    {_, a_movie } = %{
      title: movie["title"],
      original_title: movie["original_title"],
      backdrop_path: movie["backdrop_path"],
      poster_path: movie["poster_path"],
      tmdb_id: movie["id"]
    }
    |> create_movie

    Map.put(a_movie, :likes, 0)
  end
end
