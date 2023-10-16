defmodule LikeThisMovie.Mock.TMDB do
  def build(values) do
    %{
      "adult" => Map.has_key?(values, "adult") && values.adult || false,
      "backdrop_path" => Map.has_key?(values, "backdrop_path") && values.backdrop_path || "/#{Faker.String.base64(22)}.jpg",
      "genre_ids" => Map.has_key?(values, "genre_ids") && values.genre_ids || [Faker.random_between(1, 100)],
      "id" => Map.has_key?(values, "id") && values.id || Faker.random_between(10_000, 999_999),
      "media_type" => Map.has_key?(values, "media_type") && values.media_type || "movie",
      "original_language" => Map.has_key?(values, "original_language") && values.original_language || "en",
      "original_title" => Map.has_key?(values, "original_title") && values.original_title || Faker.Lorem.Shakespeare.hamlet(),
      "overview" => Map.has_key?(values, "overview") && values.overview || Faker.Lorem.paragraph(),
      "popularity" => Map.has_key?(values, "popularity") && values.popularity || Float.round(:rand.uniform() * 100, 3),
      "poster_path" => Map.has_key?(values, "poster_path") && values.poster_path || "/#{Faker.String.base64(22)}.jpg",
      "release_date" => Map.has_key?(values, "release_date") && values.release_date || Date.utc_today |> then(fn d -> "#{d.year}-#{d.month}-#{d.day}" end),
      "title" => Map.has_key?(values, "title") && values.title || Faker.Lorem.Shakespeare.hamlet(),
      "video" => Map.has_key?(values, "video") && values.video || false,
      "vote_average" => Map.has_key?(values, "vote_average") && values.vote_average || Float.round(:rand.uniform() * 10, 3),
      "vote_count" => Map.has_key?(values, "vote_count") && values.vote_count || Faker.random_between(0, 1_000),
    }
  end

  def build, do: build(%{})
end
