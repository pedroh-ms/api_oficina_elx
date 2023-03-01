defmodule ApiOficinaElx.Repo.Migrations.CreateCarros do
  use Ecto.Migration

  def change do
    create table(:carros) do
      add :nome, :string
      add :cor, :string
      add :dono_id, references(:donos, on_delete: :nothing)

      timestamps()
    end

    create index(:carros, [:dono_id])
  end
end
