defmodule RegexSolver.MixProject do
  use Mix.Project

  @version "0.1.1"
  @source_url "https://github.com/IgnacioGoldchluk/regex_solver"

  def project do
    [
      app: :regex_solver,
      version: @version,
      elixir: "~> 1.19",
      package: package(),
      description: description(),
      name: "RegexSolver",
      source_url: @source_url,
      homepage_url: @source_url,
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
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    "Regex set operations"
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Ignacio Goldchluk"],
      source_ref: "v#{@version}",
      links: %{"GitHub" => @source_url},
      files: [
        "lib",
        "native",
        "checksum-*.exs",
        "mix.exs"
      ]
    ]
  end
end
