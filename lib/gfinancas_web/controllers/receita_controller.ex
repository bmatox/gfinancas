defmodule GfinancasWeb.ReceitaController do
  use GfinancasWeb, :controller

  alias Gfinancas.Finance
  alias Gfinancas.Finance.Receita
  alias Decimal

  @spec index(Plug.Conn.t(), nil | maybe_improper_list() | map()) :: Plug.Conn.t()
  def index(conn, params) do
    receitas = Finance.list_receitas(params)
    render(conn, :index, receitas: receitas, mes: params["mes"], inicio: params["inicio"], fim: params["fim"], order: params["order"])
  end

  def new(conn, _params) do
    changeset = Finance.change_receita(%Receita{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"receita" => receita_params}) do
    case Finance.create_receita(receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita criada com sucesso.")
        |> redirect(to: ~p"/receitas/#{receita}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receita = Finance.get_receita!(id)
    render(conn, :show, receita: receita)
  end

  def edit(conn, %{"id" => id}) do
    receita = Finance.get_receita!(id)
    changeset = Finance.change_receita(receita)
    render(conn, :edit, receita: receita, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receita" => receita_params}) do
    receita = Finance.get_receita!(id)

    case Finance.update_receita(receita, receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita atualizada com sucesso.")
        |> redirect(to: ~p"/receitas/#{receita}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, receita: receita, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receita = Finance.get_receita!(id)
    {:ok, _receita} = Finance.delete_receita(receita)

    conn
    |> put_flash(:info, "Receita deletada com sucesso.")
    |> redirect(to: ~p"/receitas")
  end

  def home(conn, _params) do
    total_receitas = Receita.get_total()
    total_despesas = Despesa.get_total()
    saldo = Decimal.sub(total_receitas, total_despesas)
    receitas_mensais = Finance.receitas_mensais()

    render(conn, "home.html",
      total_receitas: total_receitas,
      total_despesas: total_despesas,
      saldo: saldo,
      receitas_mensais: receitas_mensais,
      conn: conn
    )
  end
end
