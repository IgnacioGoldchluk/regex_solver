[![CI](https://github.com/IgnacioGoldchluk/regex_solver/actions/workflows/ci.yml/badge.svg)](https://github.com/IgnacioGoldchluk/regex_solver/actions/workflows/ci.yml)
[![License](https://img.shields.io/hexpm/l/regex_solver
)](https://github.com/IgnacioGoldchluk/regex_solver/blob/main/LICENSE.md)
[![Version](https://img.shields.io/hexpm/v/regex_solver.svg)](https://hex.pm/packages/regex_solver)
[![Docs](https://img.shields.io/badge/documentation-gray.svg)](https://regex-solver.hexdocs.pm)

# RegexSolver

Regex operations using Rust's [RegexSolver](https://github.com/RegexSolver/regexsolver)

## Installation
Add to your list of dependencies

```elixir
def deps do
  [
    {:regex_solver, "~> 0.1.0"}
  ]
end
```

## Usage
```elixir
iex> RegexSolver.intersect(~r/[a-z]+/, ~r/abc|def/)
{:ok, "(abc|def)"}

iex> RegexSolver.intersect("[A-Z]+_[A-Z]+", "ENV_[A-Z]+")
{:ok, "ENV_[A-Z]+"}
```
