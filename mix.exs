defmodule RegexSolver.MixProject do
  use Mix.Project

  def project do
    [
      app: :regex_solver,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler_precompiled, "~> 0.9"},
      {:rustler, ">= 0.0.0", optional: true},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false, warn_if_outdated: true},
    ]
  end
end
