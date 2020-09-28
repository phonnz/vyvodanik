defmodule Vyvodanik.Blogs.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :content, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
