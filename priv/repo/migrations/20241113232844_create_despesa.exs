defmodule Gfinancas.Repo.Migrations.CreateDespesa do
  use Ecto.Migration

  def change do
    create table(:despesa) do
      add :nome, :string
      add :valor, :decimal
      add :data, :date

      timestamps(type: :utc_datetime)
    end
  end
end
