defmodule RegexSolverTest do
  use ExUnit.Case

  doctest RegexSolver

  describe "intersect/2" do
    test "same regular expression returns itself" do
      regex = "[a-z]_+[0-9]+"
      assert {:ok, regex} == RegexSolver.intersect(regex, regex)
    end

    test "invalid regular expression returns error" do
      regex1 = "a)"
      regex2 = "[a-z]+"
      assert {:error, "invalid regex: a)"} == RegexSolver.intersect(regex1, regex2)
    end

    test "accepts regular expression structs" do
      regex1 = ~r/[\d]+/
      regex2 = ~r/[\w]+/

      assert {:ok, "\\d+"} == RegexSolver.intersect(regex1, regex2)
    end

    test "non-overlapping regular expression return empty" do
      regex1 = "a+"
      regex2 = "[bc]+"

      assert {:error, :empty_intersection} == RegexSolver.intersect(regex1, regex2)
    end
  end
end
