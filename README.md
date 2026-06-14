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
