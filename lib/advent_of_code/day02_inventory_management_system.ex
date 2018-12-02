defmodule AdventOfCode.Day02InventoryManagementSystem do
  def part1(ids) do
    {twos, threes} =
      ids
      |> String.split("\n", trim: true)
      |> Enum.reduce({0, 0}, fn id, {a, b} ->
        {a + counts_for(id, 2), b + counts_for(id, 3)}
      end)
    twos * threes
  end

  def part2(box_ids) do
    ids = String.split(box_ids, "\n", trim: true)

    {first, second} =
      (for a <- ids, b <- ids, do: {a, b})
      |> Enum.sort_by(fn
        {a, a} -> 0
        {a, b} -> String.jaro_distance(a, b)
      end, &>=/2)
      |> List.first()

    first
    |> String.myers_difference(second)
    |> Enum.reduce("", fn
      {:eq, str}, val -> val <> str
      _, val -> val
    end)
  end

  defp counts_for(box_id, count) do
    counts =
      box_id
      |> String.codepoints()
      |> Enum.group_by(&(&1))
      |> Map.values()
      |> Enum.any?(&(length(&1) == count))
    if counts, do: 1, else: 0
  end
end
