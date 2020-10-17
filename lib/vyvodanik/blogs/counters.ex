defmodule Vyvodanik.Blogs.Counters do
  def new, do: %{}

  def add_counter(counters) do
    counters
    |> Map.put(new_counter_id(counters), 0)
  end

  def new_counter_id(counters) do
    counters
    |> Map.keys
    |> Enum.map(&String.to_integer/1)
    |> Enum.max
    |> Kernel.+(1)
    |> Integer.to_string

    rescue
      _e -> "1"
  end

  # def inc(counter, count), do:
end
