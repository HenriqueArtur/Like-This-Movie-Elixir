defmodule LikeThisMovie.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes, primary_key: false) do
      add :user_id, references(:users, on_delete: :nothing), null: false, primary_key: true
      add :movie_id, references(:movies, on_delete: :nothing), null: false, primary_key: true

      timestamps()
    end

    create index(:likes, [:user_id])
    create index(:likes, [:movie_id])
  end
end
