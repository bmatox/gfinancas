defmodule Gfinancas.Finance.Despesa do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "despesas" do
    field :data, :date
    field :nome, :string
    field :valor, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:nome, :valor, :data])
    |> validate_required([:nome, :valor, :data])
  end

  def get_total do
    from(d in __MODULE__, select: sum(d.valor)) |> Gfinancas.Repo.one() || Decimal.new(0)
  end
end
