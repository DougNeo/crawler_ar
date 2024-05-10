defmodule CrawlerAr do
  def leveros do
    produtos = Client.produtos()
    |> Map.get("conteudo")
    |> Map.get("produtos")

    produtos
    # id, nome, estoque, "status", marca-nome, precos-de, precos-por, precos-vista, url

  end
end
