defmodule CrawlerAr do
  def leveros do
    produtos =
      Client.produtos()
      |> Map.get("conteudo")
      |> Map.get("produtos")
      |> Enum.map(fn produto ->
        Map.take(produto, ["id", "nome", "estoque", "status", "url", "marca", "precos"])
      end)
      |> Enum.map(fn produto ->
        Map.update!(produto, "marca", fn marca -> Map.get(marca, "nome") end)
      end)
      |> Enum.map(fn produto ->
        Map.update!(produto, "precos", fn precos -> Map.take(precos, ["de", "por", "vista"]) end)
      end)

    produtos
    # marca-nome, precos-de, precos-por, precos-vista
  end
end
