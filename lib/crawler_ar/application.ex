defmodule CrawlerAr.Application do
  use Application

  def start(_type, _args) do
    children = [
      CrawlerAr.Repo
    ]

    opts = [strategy: :one_for_one, name: CrawlerAr.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
