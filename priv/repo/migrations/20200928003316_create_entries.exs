defmodule Vyvodanik.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :title, :string
      add :content, :string

      timestamps()
    end

  end
end
