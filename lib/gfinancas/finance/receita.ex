defmodule Gfinancas.Finance.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :data, :date
    field :nome, :string
    field :valor, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:nome, :valor, :data])
    |> validate_required([:nome, :valor, :data])
  end
end
