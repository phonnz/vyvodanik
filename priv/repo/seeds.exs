# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Vyvodanik.Repo.insert!(%Vyvodanik.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Vyvodanik.Repo
alias Vyvodanik.Blogs.Category

%Category{:name => "Fasting"}
|> Repo.insert!

%Category{:name => "Coding"}
|> Repo.insert!
