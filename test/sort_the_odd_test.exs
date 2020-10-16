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

    property "leaves even numbers at the same position" do
      forall list <- list_of_integers() do
        original_evens_with_gaps = list |> Enum.map(&self_if_even_else_nil/1)
        sorted_evens_with_gaps = list |> sort |> Enum.map(&self_if_even_else_nil/1)
        original_evens_with_gaps == sorted_evens_with_gaps
      end
    end
  end

  defp list_of_integers, do: list(integer())

  defp self_if_even_else_nil(number) when Integer.is_even(number), do: number
  defp self_if_even_else_nil(_number), do: nil
end
