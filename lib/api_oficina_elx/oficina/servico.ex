defmodule ApiOficinaElx.Oficina.Servico do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servicos" do
    field :data_entrega, :date
    field :observacao, :string
    field :preco, :decimal
    field :dono_id, :id
    field :carro_id, :id

    timestamps()
  end

  @doc false
  def changeset(servico, attrs) do
    servico
    |> cast(attrs, [:data_entrega, :preco, :observacao, :dono_id, :carro_id])
    |> validate_required([:data_entrega, :preco, :observacao, :dono_id, :carro_id])
  end
end
