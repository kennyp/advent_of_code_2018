defmodule AdventOfCode.Day01ChronalCalibration do
  def part1(changes) do
    changes
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part2(changes) do
    changes
    |> String.split("\n", trim: true)
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new([0])}, fn
      change, {freq, prev} -> seen?(freq + String.to_integer(change), prev)
    end)
  end

  defp seen?(freq, prev) do
    if MapSet.member?(prev, freq) do
      {:halt, freq}
    else
      {:cont, {freq, MapSet.put(prev, freq)}}
    end
  end
end
