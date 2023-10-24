defmodule LikeThisMovie.Movies.Like do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "likes" do
    field :user_id, :id
    field :movie_id, :id
    timestamps()
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [:user_id, :movie_id])
    |> validate_required([:user_id, :movie_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:movie_id)
    |> unique_constraint([:user_id, :movie_id])
  end
end
