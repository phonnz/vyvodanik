defmodule Vyvodanik.Repo.Migrations.AddEntryCategoryAssoc do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      add :category, :binary_id
    end
  end
end
