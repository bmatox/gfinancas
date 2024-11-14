defmodule Gfinancas.Repo.Migrations.CreateReceita do
  use Ecto.Migration

  def change do
    create table(:receita) do
      add :nome, :string
      add :valor, :decimal
      add :data, :date

      timestamps(type: :utc_datetime)
    end
  end
end
