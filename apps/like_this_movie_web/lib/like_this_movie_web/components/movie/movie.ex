defmodule LikeThisMovieWeb.Movie do
  use Phoenix.Component
  import LikeThisMovieWeb.CoreComponents

  def movie(assigns) do
    ~H"""
    <article class="w-44 rounded-lg shadow-lg ring-1 ring-gray-900/5 m-2">
      <div class="relative">
        <button class="rounded-full bg-purple-600 text-white absolute p-2 right-3 top-3">
          <.icon name={"material-favorite"} />
        </button>
        <img
          class="rounded-t-lg"
          src="https://image.tmdb.org/t/p/w500/yqnNLn24shYnZ6kqGpbwuB3NJ0D.jpg"
          alt="Minha Figura">
        <div class="absolute -bottom-2 ml-2">
          <span class="bg-yellow-400 rounded p-1">#1</span>
        </div>
      </div>
      <div class="flex flex-col px-4 py-4">
          <h3 class="font-semibold text-ellipsis overflow-hidden leading-5 h-16">A big name, too biiiiigggggggggggg lorem saassasasasas dsdsds</h3>
          <div class="mt-2 text-white font-medium">
            <span class="bg-purple-600 rounded p-1 px-2">
              Likes: 999
            </span>
          </div>
      </div>
    </article>
    """
  end
end
