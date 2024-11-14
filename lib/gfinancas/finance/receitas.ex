defmodule Gfinancas.Finance.Receitas do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

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

  def get_total do
    from(r in __MODULE__, select: sum(r.valor)) |> Gfinancas.Repo.one() || Decimal.new(0)
  end
end
