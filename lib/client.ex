defmodule Client do
  use Tesla

  def produtos do
    query = [url: "/ar-condicionado", offset: 0, limit: 100, order: "Popularidade"]
    {:ok, %Tesla.Env{body: body}} = Tesla.get(client(), "/", query: query)
    body
  end

  def client do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://www.leveros.com.br/api/v2/front/url/product/listing/category"},
      {Tesla.Middleware.Headers, [{"App-Token", "wapstore"}, {"User-Agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1"}]},
      Tesla.Middleware.JSON
    ]

    Tesla.client(middleware)
  end
end
