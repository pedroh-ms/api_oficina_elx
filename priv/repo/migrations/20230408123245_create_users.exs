defmodule ApiOficinaElx.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nick_name, :string, null: false
      add :email, :string
      add :password, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nick_name])
  end
end
