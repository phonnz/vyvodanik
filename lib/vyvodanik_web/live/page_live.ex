defmodule VyvodanikWeb.PageLive do
  use VyvodanikWeb, :live_view

  alias Vyvodanik.Blogs
  alias Vyvodanik.Blogs.Counters

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(%{
        entries: Blogs.list_entries(),
        counters: list_counters() })}
  end

  @impl true
  def handle_event("inc", %{"value" => name}, socket) do
    counters = socket.assigns.counters |> Counters.inc_count(name)
    {:noreply, assign(socket, counters: counters )}
  end

  @impl true
  def handle_event("dec", %{"value" => name}, socket) do

    {:noreply, assign(socket, counters: socket.assigns.counters |> Counters.dec_count(name) )}
  end

  @impl true
  def handle_event("add-counter", _, socket) do
    {:noreply, assign(socket, %{counters: socket.assigns.counters |> Counters.add_counter})}
  end

  def list_counters do
    Counters.new()
  end
end
