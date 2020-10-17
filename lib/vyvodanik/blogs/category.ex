defmodule Vyvodanik.Blogs.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vyvodanik.Blogs.Entry

  @primary_key {:id, :binary_id, primary_key: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :name, :string
    has_many :entries, Entry

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
