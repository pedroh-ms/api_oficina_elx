defmodule ApiOficinaElx.Oficina.Carro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carros" do
    field :cor, :string
    field :nome, :string
    field :dono_id, :id

    timestamps()
  end

  @doc false
  def changeset(carro, attrs) do
    carro
    |> cast(attrs, [:nome, :cor, :dono_id])
    |> validate_required([:nome, :cor, :dono_id])
  end
end
