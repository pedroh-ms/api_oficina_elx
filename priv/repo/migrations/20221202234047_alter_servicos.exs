defmodule ApiOficinaElx.Repo.Migrations.AlterServicos do
  use Ecto.Migration

  def change do
    execute "ALTER TABLE servicos DROP FOREIGN KEY servicos_dono_id_fkey"
    execute "ALTER TABLE servicos DROP FOREIGN KEY servicos_carro_id_fkey"
    alter table(:servicos) do
      modify :dono_id, references(:donos, on_delete: :nothing), null: false
      modify :carro_id, references(:carros, on_delete: :nothing), null: false
      modify :preco, :decimal, precision: 6, scale: 2
    end
  end
end
