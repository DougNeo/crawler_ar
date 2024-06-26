defmodule CrawlerAr.MixProject do
  use Mix.Project

  def project do
    [
      app: :crawler_ar,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {CrawlerAr.Application, []},
      extra_applications: [:logger, :runtime_tools, :ecto_sql, :postgrex]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:floki, "~> 0.36.0"},
      {:tesla, "~> 1.9"},
      {:jason, "~> 1.4"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
