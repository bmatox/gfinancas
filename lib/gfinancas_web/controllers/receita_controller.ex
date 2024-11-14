defmodule GfinancasWeb.ReceitaController do
  use GfinancasWeb, :controller

  alias Gfinancas.Finance
  alias Gfinancas.Finance.Receita

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
        |> put_flash(:info, "Receita created successfully.")
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
        |> put_flash(:info, "Receita updated successfully.")
        |> redirect(to: ~p"/receitas/#{receita}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, receita: receita, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receita = Finance.get_receita!(id)
    {:ok, _receita} = Finance.delete_receita(receita)

    conn
    |> put_flash(:info, "Receita deleted successfully.")
    |> redirect(to: ~p"/receitas")
  end
end
