defmodule ApiOficinaElx.Repo.Migrations.AlterMaterialComprados do
  use Ecto.Migration

  def change do
    alter table(:material_comprados) do
      modify :nome, :string, size: 30
      modify :preco, :decimal, precision: 6, scale: 2
    end
  end
end
