defmodule RegexSolver do
  @moduledoc """
  Regex operations using Rust's [RegexSolver](https://github.com/RegexSolver/regexsolver)
  """
  version = Mix.Project.config()[:version]
  github_url = Mix.Project.config()[:package][:links]["GitHub"]

  use RustlerPrecompiled,
    otp_app: :regex_solver,
    base_url: "#{github_url}/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_BUILD") in ["1", "true"],
    targets:
      Enum.uniq(["aarch64-unknown-linux-musl" | RustlerPrecompiled.Config.default_targets()]),
    version: version

  @type op_error :: :invalid_regex | :empty_intersection

  @doc """
  Computes the intersecion of two regular expressions

  ## Examples
      iex> RegexSolver.intersect(~r/[a-z]+/, ~r/abc|def/)
      {:ok, "(abc|def)"}

      iex> RegexSolver.intersect("[A-Z]+_[A-Z]+", "ENV_[A-Z]+")
      {:ok, "ENV_[A-Z]+"}

      iex> RegexSolver.intersect(~r/[0-9]+/, ~r/[A-Z][a-z]+/)
      {:error, :empty_intersection}

      iex> RegexSolver.intersect("a|b", "b")
      {:ok, "b"}

      iex> RegexSolver.intersect("a)", "a|b|c")
      {:error, "invalid regex: a)"}
  """
  @spec intersect(Regex.t() | String.t(), Regex.t() | String.t()) ::
          {:ok, String.t()} | {:error, op_error()}
  def intersect(%Regex{} = re1, re2), do: intersect(re1.source, re2)
  def intersect(re1, %Regex{} = re2), do: intersect(re1, re2.source)

  def intersect(re1, re2) when is_binary(re1) and is_binary(re2) do
    case intersection(re1, re2) do
      {:ok, "[]"} -> {:error, :empty_intersection}
      {:ok, pattern} -> {:ok, pattern}
      {:error, _reason} = error -> error
    end
  end

  defp intersection(_str1, _str2), do: :erlang.nif_error(:nif_not_loaded)
end
