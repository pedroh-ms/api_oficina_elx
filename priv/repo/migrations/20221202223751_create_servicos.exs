defmodule ApiOficinaElx.Repo.Migrations.CreateServicos do
  use Ecto.Migration

  def change do
    create table(:servicos) do
      add :data_entrega, :date
      add :preco, :decimal
      add :observacao, :text
      add :dono_id, references(:donos, on_delete: :nothing)
      add :carro_id, references(:carros, on_delete: :nothing)

      timestamps()
    end

    create index(:servicos, [:dono_id])
    create index(:servicos, [:carro_id])
  end
end
