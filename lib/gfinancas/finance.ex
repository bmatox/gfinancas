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
  defp filtrar_por_mes(query, mes) do
    from r in query, where: fragment("date_part('month', ?) = ?", r.data, ^String.to_integer(String.slice(mes, 5, 2)))
  end

  defp filtrar_por_periodo(query, nil, nil), do: query
  defp filtrar_por_periodo(query, inicio, fim) do
    from r in query, where: r.data >= ^inicio and r.data <= ^fim
  end

  defp ordenar_receitas(query, "maiores"), do: from r in query, order_by: [desc: r.valor]
  defp ordenar_receitas(query, "menores"), do: from r in query, order_by: [asc: r.valor]
  defp ordenar_receitas(query, _), do: query

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

  defp ordenar_despesas(query, "maiores"), do: from d in query, order_by: [desc: d.valor]
  defp ordenar_despesas(query, "menores"), do: from d in query, order_by: [asc: d.valor]
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
end
