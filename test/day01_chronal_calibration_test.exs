defmodule AdventOfCode.Day01ChronalCalibrationTest do
  use ExUnit.Case

  alias AdventOfCode.Day01ChronalCalibration, as: Day

  test "it can calculate the final frequency" do
    assert 3 == Day.part1("+1\n+1\n+1")
    assert 0 == Day.part1("+1\n+1\n-2")
    assert -6 == Day.part1("-1\n-2\n-3")
  end

  test "it can the first frequency it reaches twice" do
    assert 0 == Day.part2("+1\n-1")
    assert 10 == Day.part2("+3\n+3\n+4\n-2\n-4")
    assert 5 == Day.part2("-6\n+3\n+8\n+5\n-6")
    assert 14 == Day.part2("+7\n+7\n-2\n-7\n-4")
  end
end
