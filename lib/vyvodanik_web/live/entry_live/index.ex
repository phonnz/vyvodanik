defmodule VyvodanikWeb.EntryLive.Index do
  use VyvodanikWeb, :live_view

  alias Vyvodanik.Blogs
  alias Vyvodanik.Blogs.Entry

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(%{entries: list_entries() } )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Entry")
    |> assign(:entry, Blogs.get_entry!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Entry")
    |> assign(:entry, %Entry{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Entries")
    |> assign(:entry, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    entry = Blogs.get_entry!(id)
    {:ok, _} = Blogs.delete_entry(entry)

    {:noreply, assign(socket, :entries, list_entries())}
  end

  defp list_entries do
    Blogs.list_entries()
  end
end
