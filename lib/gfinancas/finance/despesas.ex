defmodule Gfinancas.Finance.Despesas do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "despesa" do
    field :data, :date
    field :nome, :string
    field :valor, :decimal

    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(),
           %{
             optional(atom()) =>
               atom()
               | {:array | :assoc | :embed | :in | :map | :parameterized | :supertype | :try,
                  any()}
           }}
          | %{
              :__struct__ => atom() | %{:__changeset__ => any(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(despesas, attrs) do
    despesas
    |> cast(attrs, [:nome, :valor, :data])
    |> validate_required([:nome, :valor, :data])
  end

  def get_total do
    from(d in __MODULE__, select: sum(d.valor)) |> Gfinancas.Repo.one() || Decimal.new(0)
  end
end
