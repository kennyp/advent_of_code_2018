defmodule AdventOfCode.Day02InventoryManagementSystem do
  def part1(ids) do
    {x, y} =
      ids
      |> String.split("\n", trim: true)
      |> Enum.reduce({0, 0}, fn id, {a, b} ->
        case {duces(id), trips(id)} do
          {false, false} -> {a, b}
          {true, true} -> {a + 1, b + 1}
          {true, false} -> {a + 1, b}
          {false, true} -> {a, b + 1}
        end
      end)
    x * y
  end

  def part2(box_ids) do
    ids = String.split(box_ids, "\n", trim: true)

    {_distance, first, second} =
      for a <- ids, b <- ids do
        {String.jaro_distance(a, b), a, b}
      end
      |> Enum.sort_by(&elem(&1, 0), &>=/2)
      |> Enum.drop_while(&(elem(&1, 0) == 1))
      |> List.first()

    first
    |> String.myers_difference(second)
    |> Enum.reduce("", fn
      {:eq, str}, val -> val <> str
      _, val -> val
    end)
  end

  defp duces(box_id) do
    box_id
    |> groups()
    |> Enum.any?(&(length(&1) == 2))
  end

  defp trips(box_id) do
    box_id
    |> groups()
    |> Enum.any?(&(length(&1) == 3))
  end

  defp groups(box_id) do
    box_id |> String.codepoints() |> Enum.group_by(&id/1) |> Map.values()
  end

  defp id(value), do: value
end
