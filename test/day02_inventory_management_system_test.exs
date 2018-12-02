defmodule AdventOfCode.Day02InventoryManagementSystemTest do
  use ExUnit.Case

  alias AdventOfCode.Day02InventoryManagementSystem, as: Day

  test "can find checksum" do
    input = "abcdef\nbababc\nabbcde\nabcccd\naabcdd\nabcdee\nababab"
    assert 12 == Day.part1(input)
  end

  test "can find common closest" do
    input = "abcde\nfghij\nklmno\npqrst\nfguij\naxcye\nwvxyz"
    assert "fgij" == Day.part2(input)
  end
end
