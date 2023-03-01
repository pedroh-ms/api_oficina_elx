defmodule ApiOficinaElx.Repo.Migrations.CreateDonos do
  use Ecto.Migration

  def change do
    create table(:donos) do
      add :nome, :string
      add :numero_celular, :integer

      timestamps()
    end
  end
end
