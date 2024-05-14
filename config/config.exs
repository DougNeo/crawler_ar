import Config
config :crawler_ar, ecto_repos: [CrawlerAr.Repo]

config :crawler_ar, CrawlerAr.Repo,
  database: "crawler_ar_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
