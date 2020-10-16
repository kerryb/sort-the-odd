defmodule SortTheOddTest do
  use ExUnit.Case
  use PropCheck

  import SortTheOdd

  describe "SortTheOdd.sort/1" do
    property "returns a list the same length as its input" do
      forall list <- list_of_integers do
        length(sort(list)) == length(list)
      end
    end
  end

  defp list_of_integers, do: list(integer())
end
