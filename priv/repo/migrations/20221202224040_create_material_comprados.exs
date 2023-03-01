defmodule ApiOficinaElx.Repo.Migrations.CreateMaterialComprados do
  use Ecto.Migration

  def change do
    create table(:material_comprados) do
      add :nome, :string
      add :dia, :date
      add :preco, :decimal

      timestamps()
    end
  end
end
