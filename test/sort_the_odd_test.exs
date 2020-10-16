defmodule SortTheOddTest do
  use ExUnit.Case
  use PropCheck

  require Integer

  import SortTheOdd

  describe "SortTheOdd.sort/1" do
    property "returns a list the same length as its input" do
      forall list <- list_of_integers() do
        length(sort(list)) == length(list)
      end
    end

    property "sorts odd numbers in the list" do
      forall list <- list_of_integers() do
        odds = list |> sort |> Enum.filter(&Integer.is_odd/1)
        odds == Enum.sort(odds)
      end
    end
  end

  defp list_of_integers, do: list(integer())
end
