defmodule ApiOficinaElx.Oficina.MaterialComprado do
  use Ecto.Schema
  import Ecto.Changeset

  schema "material_comprados" do
    field :dia, :date
    field :nome, :string
    field :preco, :decimal

    timestamps()
  end

  @doc false
  def changeset(material_comprado, attrs) do
    material_comprado
    |> cast(attrs, [:nome, :dia, :preco])
    |> validate_required([:nome, :dia, :preco])
  end
end
