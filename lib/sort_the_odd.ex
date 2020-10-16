defmodule SortTheOdd do
  require Integer

  def sort(list) do
    sorted_odds = list |> Enum.filter(&Integer.is_odd/1) |> Enum.sort()
    intersperse_odds(list, sorted_odds)
  end

  defp intersperse_odds([], []), do: []

  defp intersperse_odds([head | tail], odds) when Integer.is_even(head) do
    [head | intersperse_odds(tail, odds)]
  end

  defp intersperse_odds([_head | tail], [odd | odds]) do
    [odd | intersperse_odds(tail, odds)]
  end
end
