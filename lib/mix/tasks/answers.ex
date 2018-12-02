defmodule Mix.Tasks.Answers do
  use Mix.Task

  @shortdoc "Show all the answers"
  def run(_) do
    Application.ensure_started(:advent_of_code)

    "fixtures/*.txt"
    |> Path.wildcard()
    |> Enum.map(fn fixture ->
      mod = find_module(fixture)
      input = File.read!(fixture)

      IO.puts([
        fixture,
        "\n - #{mod.part1(input)}",
        "\n - #{mod.part2(input)}"
      ])
    end)
  end

  defp find_module(fixture) do
    day = Path.basename(fixture, ".txt")

    with {:ok, modules} <- :application.get_key(:advent_of_code, :modules) do
      modules
      |> Enum.find(fn module ->
        module
        |> Atom.to_string()
        |> String.downcase()
        |> String.starts_with?("elixir.adventofcode.#{day}")
      end)
    end
  end
end
