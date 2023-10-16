defmodule LikeThisMovie.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :original_title, :string
      add :backdrop_path, :string
      add :poster_path, :string

      timestamps()
    end
  end
end
