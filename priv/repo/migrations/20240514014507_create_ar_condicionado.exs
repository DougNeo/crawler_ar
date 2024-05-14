defmodule CrawlerAr.Repo.Migrations.CreateArCondicionado do
  use Ecto.Migration

  def change do
    create table(:ar_condicionado) do
      add :marca, :string
      add :modelo, :string
      add :tipo, :string
      add :btus, :string
      add :preco, :string
      add :url, :string
      add :created_at, :naive_datetime
      add :updated_at, :naive_datetime
    end

  end
end
