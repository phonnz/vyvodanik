defmodule Vyvodanik.Blogs.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vyvodanik.Blogs.Category

  schema "entries" do
    field :content, :string
    field :title, :string
    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:title, :content])
    # |> Ecto.assoc()
    |> validate_required([:title, :content])
  end
end
