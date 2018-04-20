defmodule Mix.Tasks.Report.Video do
  use Mix.Task
  import Ecto.Query
  alias Rumbl.Repo
  alias Rumbl.Video

  @shortdoc "Counts the number of videos"

      def run(_) do
        Mix.Task.run "app.start"
        action = Repo.one from u in Video,
          select: count(u.id),
          where: (u.category_id == 1)

        drama = Repo.one from u in Video,
          select: count(u.id),
          where: (u.category_id == 2)

        romance = Repo.one from u in Video,
          select: count(u.id),
          where: (u.category_id == 3)

        comedy = Repo.one from u in Video,
          select: count(u.id),
          where: (u.category_id == 4)

        scifi = Repo.one from u in Video,
          select: count(u.id),
          where: (u.category_id == 5)

        IO.puts "Comedy: #{comedy} videos"
        IO.puts  "Action: #{action} videos"
        IO.puts "Romance: #{romance} videos"
        IO.puts "Drama: #{drama} videos"
        IO.puts "Scifi: #{scifi} videos"
      end
    end
