defmodule GfinancasWeb.PageController do
  use GfinancasWeb, :controller

  alias Gfinancas.Finance.{Receita, Despesa}
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
end
