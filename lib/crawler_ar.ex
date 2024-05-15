# defmodule CrawlerAr do
#   def leveros do
#     produtos =
#       Client.produtos()
#       |> Map.get("conteudo")
#       |> Map.get("produtos")
#       |> Enum.map(fn produto ->
#         Map.take(produto, ["id", "nome", "estoque", "status", "url", "marca", "precos"])
#       end)
#       |> Enum.map(fn produto ->
#         Map.update!(produto, "marca", fn marca -> Map.get(marca, "nome") end)
#       end)
#       |> Enum.map(fn produto ->
#         Map.update!(produto, "precos", fn precos -> Map.take(precos, ["de", "por", "vista"]) end)
#       end)
#       |> Enum.map(fn produto ->
#         Map.put_new(produto, "preco_de", produto["precos"]["de"])
#       end)
#       |> Enum.map(fn produto ->
#         Map.put_new(produto, "preco_por", produto["precos"]["por"])
#       end)
#       |> Enum.map(fn produto ->
#         Map.put_new(produto, "preco_vista", produto["precos"]["vista"])
#       end)
#       |> Enum.map(fn produto ->
#         Map.delete(produto, "precos")
#       end)

#     produtos
#   end
# end

defmodule CrawlerAr do
  def leveros do
    Client.produtos()
    |> Map.get("conteudo", [])
    |> Map.get("produtos", [])
    |> Enum.map(&clean_product/1)
  end

  defp clean_product(product) do
    product
    |> Map.take(["id", "nome", "estoque", "status", "url", "marca", "precos"])
    |> Map.update!("marca", fn marca -> fetch_marca_name(marca) end)
    |> Map.update!("precos", fn precos -> clean_precos(precos) end)
    |> add_preco_fields()
    |> Map.drop(["precos"])
  end

  defp fetch_marca_name(marca) do
    Map.get(marca, "nome")
  end

  defp clean_precos(precos) do
    Map.take(precos, ["de", "por", "vista"])
  end

  defp add_preco_fields(map) do
    preco_de = Map.get(map["precos"], "de")
    preco_por = Map.get(map["precos"], "por")
    preco_vista = Map.get(map["precos"], "vista")

    Map.put_new(map, "preco_de", preco_de)
    |> Map.put_new("preco_por", preco_por)
    |> Map.put_new("preco_vista", preco_vista)
  end
end
