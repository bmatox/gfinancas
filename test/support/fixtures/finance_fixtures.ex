defmodule Gfinancas.FinanceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gfinancas.Finance` context.
  """

  @doc """
  Generate a receitas.
  """
  def receitas_fixture(attrs \\ %{}) do
    {:ok, receitas} =
      attrs
      |> Enum.into(%{
        data: ~D[2024-11-12],
        nome: "some nome",
        valor: "120.5"
      })
      |> Gfinancas.Finance.create_receitas()

    receitas
  end

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        data: ~D[2024-11-12],
        nome: "some nome",
        valor: "120.5"
      })
      |> Gfinancas.Finance.create_receita()

    receita
  end

  @doc """
  Generate a despesas.
  """
  def despesas_fixture(attrs \\ %{}) do
    {:ok, despesas} =
      attrs
      |> Enum.into(%{
        data: ~D[2024-11-12],
        nome: "some nome",
        valor: "120.5"
      })
      |> Gfinancas.Finance.create_despesas()

    despesas
  end

  @doc """
  Generate a despesa.
  """
  def despesa_fixture(attrs \\ %{}) do
    {:ok, despesa} =
      attrs
      |> Enum.into(%{
        data: ~D[2024-11-12],
        nome: "some nome",
        valor: "120.5"
      })
      |> Gfinancas.Finance.create_despesa()

    despesa
  end
end
