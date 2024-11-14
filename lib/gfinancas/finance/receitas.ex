defmodule Gfinancas.Finance.Receitas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receita" do
    field :data, :date
    field :nome, :string
    field :valor, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(receitas, attrs) do
    receitas
    |> cast(attrs, [:nome, :valor, :data])
    |> validate_required([:nome, :valor, :data])
  end
end
