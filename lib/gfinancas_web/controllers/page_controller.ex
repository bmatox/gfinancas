defmodule GfinancasWeb.PageController do
  use GfinancasWeb, :controller

  alias Gfinancas.Finance.{Receita, Despesa}
  alias Gfinancas.Finance
  alias Decimal

  def home(conn, _params) do
    total_receitas = Receita.get_total()
    total_despesas = Despesa.get_total()
    saldo = Decimal.sub(total_receitas, total_despesas)

    render(conn, "home.html",
      total_receitas: total_receitas,
      total_despesas: total_despesas,
      saldo: saldo,
      conn: conn
    )
  end

  def get_receitas_mensais(conn, _params) do
    receitas = Finance.list_receitas_mensais()
    json(conn, receitas)
  end

  def get_despesas_mensais(conn, _params) do
    despesas = Finance.list_despesas_mensais()
    json(conn, despesas)
  end

end
