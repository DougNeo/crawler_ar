defmodule CrawlerAr do
  def leveros do
    Client.produtos()
    |> Map.get("produtos")

  end
end
