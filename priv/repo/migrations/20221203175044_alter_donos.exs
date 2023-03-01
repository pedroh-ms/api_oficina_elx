defmodule ApiOficinaElx.Repo.Migrations.AlterDonos do
  use Ecto.Migration

  def change do
    alter table(:donos) do
      modify :nome, :string, size: 40
      modify :numero_celular, :decimal, precision: 11, scale: 0
    end
  end
end
