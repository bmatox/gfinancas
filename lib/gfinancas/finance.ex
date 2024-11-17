defmodule Gfinancas.Finance do
  @moduledoc """
  The Finance context.
  """

  import Ecto.Query, warn: false
  alias Gfinancas.Repo
  alias Gfinancas.Finance.{Receita, Despesa}

  @doc """
  Returns the list of receitas.

  ## Examples

      iex> list_receitas()
      [%Receita{}, ...]

  """
def list_receitas(params \\ %{}) do
  Receita
  |> filtrar_por_mes(params["mes"])
  |> filtrar_por_periodo(params["inicio"], params["fim"])
  |> ordenar_receitas(params["order"])
  |> Repo.all()
end

defp filtrar_por_mes(query, nil), do: query
defp filtrar_por_mes(query, ""), do: query
defp filtrar_por_mes(query, mes) do
  IO.inspect(mes, label: "Valor do Mês")
  from r in query, where: fragment("date_part('month', ?) = ?", r.data, ^String.to_integer(String.slice(mes, 5, 2)))
end

defp filtrar_por_periodo(query, nil, nil), do: query
defp filtrar_por_periodo(query, inicio, fim) when inicio == "" and fim == "" do
  query
end
defp filtrar_por_periodo(query, inicio, "") when is_binary(inicio) and inicio != "" do
  from r in query, where: r.data >= ^inicio
end
defp filtrar_por_periodo(query, "", fim) when is_binary(fim) and fim != "" do
  from r in query, where: r.data <= ^fim
end
defp filtrar_por_periodo(query, inicio, fim) do
  from r in query, where: r.data >= ^inicio and r.data <= ^fim
end

defp ordenar_receitas(query, nil), do: query
defp ordenar_receitas(query, ""), do: query
defp ordenar_receitas(query, "maiores") do
  from r in query, order_by: [desc: r.valor]
end
defp ordenar_receitas(query, "menores") do
  from r in query, order_by: [asc: r.valor]
end
defp ordenar_receitas(query, order) when order not in ["maiores", "menores"], do: query

  @spec list_despesas(nil | maybe_improper_list() | map()) :: any()
  @doc """
  Returns the list of despesas.

  ## Examples

      iex> list_despesas()
      [%Despesa{}, ...]

  """
@spec list_despesas(nil | maybe_improper_list() | map()) :: any()
@doc """
Returns the list of despesas.

## Examples

    iex> list_despesas()
    [%Despesa{}, ...]

"""
def list_despesas(params \\ %{}) do
  Despesa
  |> filtrar_por_mes(params["mes"])
  |> filtrar_por_periodo(params["inicio"], params["fim"])
  |> ordenar_despesas(params["order"])
  |> Repo.all()
end

defp filtrar_por_mes(query, nil), do: query
defp filtrar_por_mes(query, ""), do: query
defp filtrar_por_mes(query, mes) do
  IO.inspect(mes, label: "Valor do Mês")
  from d in query, where: fragment("date_part('month', ?) = ?", d.data, ^String.to_integer(String.slice(mes, 5, 2)))
end

defp filtrar_por_periodo(query, nil, nil), do: query
defp filtrar_por_periodo(query, "", ""), do: query
defp filtrar_por_periodo(query, inicio, "") when is_binary(inicio) and inicio != "" do
  from d in query, where: d.data >= ^inicio
end
defp filtrar_por_periodo(query, "", fim) when is_binary(fim) and fim != "" do
  from d in query, where: d.data <= ^fim
end
defp filtrar_por_periodo(query, inicio, fim) do
  from d in query, where: d.data >= ^inicio and d.data <= ^fim
end

defp ordenar_despesas(query, nil), do: query
defp ordenar_despesas(query, ""), do: query
defp ordenar_despesas(query, "maiores") do
  from d in query, order_by: [desc: d.valor]
end
defp ordenar_despesas(query, "menores") do
  from d in query, order_by: [asc: d.valor]
end
defp ordenar_despesas(query, _), do: query


  # Funções para Receitas
  def get_receita!(id), do: Repo.get!(Receita, id)

  def create_receita(attrs \\ %{}) do
    %Receita{}
    |> Receita.changeset(attrs)
    |> Repo.insert()
  end

  def update_receita(%Receita{} = receita, attrs) do
    receita
    |> Receita.changeset(attrs)
    |> Repo.update()
  end

  def delete_receita(%Receita{} = receita) do
    Repo.delete(receita)
  end

  def change_receita(%Receita{} = receita, attrs \\ %{}) do
    Receita.changeset(receita, attrs)
  end

  # Funções para Despesas
  def get_despesa!(id), do: Repo.get!(Despesa, id)

  def create_despesa(attrs \\ %{}) do
    %Despesa{}
    |> Despesa.changeset(attrs)
    |> Repo.insert()
  end

  def update_despesa(%Despesa{} = despesa, attrs) do
    despesa
    |> Despesa.changeset(attrs)
    |> Repo.update()
  end

  def delete_despesa(%Despesa{} = despesa) do
    Repo.delete(despesa)
  end

  def change_despesa(%Despesa{} = despesa, attrs \\ %{}) do
    Despesa.changeset(despesa, attrs)
  end
  def list_receitas_mensais do
    from(r in Receita,
    select: %{mes: fragment("date_part('month', ?)", r.data), total: sum(r.valor)},
    group_by: fragment("date_part('month', ?)", r.data)
    )
    |> Repo.all()
  end

  def list_despesas_mensais do
    from(d in Despesa,
      select: %{mes: fragment("date_part('month', ?)", d.data), total: sum(d.valor)},
      group_by: fragment("date_part('month', ?)", d.data)
    )
    |> Repo.all()
  end

end
