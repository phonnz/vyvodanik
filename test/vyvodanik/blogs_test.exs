defmodule Vyvodanik.BlogsTest do
  use Vyvodanik.DataCase

  alias Vyvodanik.Blogs

  describe "entries" do
    alias Vyvodanik.Blogs.Entry

    @valid_attrs %{content: "some content", title: "some title"}
    @update_attrs %{content: "some updated content", title: "some updated title"}
    @invalid_attrs %{content: nil, title: nil}

    def entry_fixture(attrs \\ %{}) do
      {:ok, entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blogs.create_entry()

      entry
    end

    test "list_entries/0 returns all entries" do
      entry = entry_fixture()
      assert Blogs.list_entries() == [entry]
    end

    test "get_entry!/1 returns the entry with given id" do
      entry = entry_fixture()
      assert Blogs.get_entry!(entry.id) == entry
    end

    test "create_entry/1 with valid data creates a entry" do
      assert {:ok, %Entry{} = entry} = Blogs.create_entry(@valid_attrs)
      assert entry.content == "some content"
      assert entry.title == "some title"
    end

    test "create_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_entry(@invalid_attrs)
    end

    test "update_entry/2 with valid data updates the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{} = entry} = Blogs.update_entry(entry, @update_attrs)
      assert entry.content == "some updated content"
      assert entry.title == "some updated title"
    end

    test "update_entry/2 with invalid data returns error changeset" do
      entry = entry_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_entry(entry, @invalid_attrs)
      assert entry == Blogs.get_entry!(entry.id)
    end

    test "delete_entry/1 deletes the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{}} = Blogs.delete_entry(entry)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_entry!(entry.id) end
    end

    test "change_entry/1 returns a entry changeset" do
      entry = entry_fixture()
      assert %Ecto.Changeset{} = Blogs.change_entry(entry)
    end
  end
end
