defmodule Egndf.Mixfile do
  use Mix.Project

  @version "0.2.2"

  def project do
    [app: :egndf,
     version: @version,
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :poison, :httpoison, :confex]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.10.0"},
     {:poison, "~> 2.2"},
     {:confex, ">= 0.0.0"},
     {:dogma, "~> 0.1", only: [:dev, :test]},
     {:credo, "~> 0.4", only: [:dev, :test]},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    Simple Elixir client for open-source decision engine Gandalf https://gndf.io/.
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :egndf,
     files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
     maintainers: ["Pavel Vesnin", "Nebo #15"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/Nebo15/egndf",
              "Docs" => "http://docs.gandalf4.apiary.io/"}]
  end
end
