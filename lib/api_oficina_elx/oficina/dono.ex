defmodule ApiOficinaElx.Oficina.Dono do
  use Ecto.Schema
  import Ecto.Changeset

  schema "donos" do
    field :nome, :string
    field :numero_celular, :decimal

    timestamps()
  end

  @doc false
  def changeset(dono, attrs) do
    dono
    |> cast(attrs, [:nome, :numero_celular])
    |> validate_required([:nome, :numero_celular])
  end
end
