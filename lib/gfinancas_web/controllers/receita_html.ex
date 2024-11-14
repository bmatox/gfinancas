defmodule GfinancasWeb.ReceitaHTML do
  use GfinancasWeb, :html

  import Phoenix.HTML
  import Timex  # Importando o Timex para formatação de data

  embed_templates "receita_html/*"

  @doc """
  Renders a receita form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def receita_form(assigns)

  # Função para formatar a data no padrão brasileiro
  defp format_date(%Date{} = date) do
    Timex.format!(date, "%d/%m/%Y", :strftime)
  end

  # Função para formatar o valor com duas casas decimais e o símbolo do real
  defp format_currency(value) do
    value
    |> Decimal.to_float()
    |> :erlang.float_to_binary([decimals: 2])
  end
end
