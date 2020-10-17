defmodule Vyvodanik.Repo.Migrations.FixEntryCategoryAssoc do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      remove :category
    end
    alter table(:entries) do
      add :category_id, references(:categories, type: :uuid)
    end
  end
end
