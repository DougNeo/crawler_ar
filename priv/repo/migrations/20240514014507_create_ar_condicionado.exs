defmodule CrawlerAr.Repo.Migrations.CreateArCondicionado do
  use Ecto.Migration

  def change do
    create table(:produto) do
      add :estoque, :integer
      add :marca, :string
      add :nome, :string
      add :preco_de, :float
      add :preco_por, :float
      add :preco_vista, :float
      add :site_id, :integer
      add :status, :string
      add :url, :string

      timestamps()
    end

  end
end
