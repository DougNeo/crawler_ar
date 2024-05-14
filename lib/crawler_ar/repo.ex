defmodule CrawlerAr.Repo do
  use Ecto.Repo,
    otp_app: :crawler_ar,
    adapter: Ecto.Adapters.Postgres
end
