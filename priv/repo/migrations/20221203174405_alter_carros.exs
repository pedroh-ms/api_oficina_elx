defmodule ApiOficinaElx.Repo.Migrations.AlterCarros do
  use Ecto.Migration

  def change do
    execute "ALTER TABLE carros DROP FOREIGN KEY carros_dono_id_fkey"
    alter table(:carros) do
      modify :nome, :string, size: 30
      modify :cor, :string, size: 20
      modify :dono_id, references(:donos, on_delete: :nothing), null: false
    end
  end
end
