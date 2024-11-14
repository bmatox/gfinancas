defmodule Gfinancas.Finance.Despesas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesa" do
    field :data, :date
    field :nome, :string
    field :valor, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(despesas, attrs) do
    despesas
    |> cast(attrs, [:nome, :valor, :data])
    |> validate_required([:nome, :valor, :data])
  end
end
