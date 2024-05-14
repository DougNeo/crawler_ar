defmodule CrawlerAr.Application do
  use Application

  def start(_type, _args) do
    _children = [
      CrawlerAr.Repo
    ]
  end
end
