defmodule CrawlerAr.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:nome, :estoque, :status, :url, :marca, :preco_de, :preco_por, :preco_vista, :site_id]

  schema "produto" do
    field :nome, :string
    field :estoque, :integer
    field :status, :string
    field :url, :string
    field :marca, :string
    field :preco_de, :float
    field :preco_por, :float
    field :preco_vista, :float
    field :site_id, :integer

    timestamps()
  end

  def changeset(produtos, attrs) do
    produtos
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
