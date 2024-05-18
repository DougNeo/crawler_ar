defmodule CrawlerAr.Produtos.Create do
  alias CrawlerAr.Produto
  alias CrawlerAr.Repo

  def call(produtos) do
    produtos
    |> Enum.map(&Produto.changeset(%Produto{}, &1))
    |> Enum.map(&Repo.insert!(&1))
  end

end
