defmodule Gfinancas.Finance do
  @moduledoc """
  The Finance context.
  """

  import Ecto.Query, warn: false
  alias Gfinancas.Repo

  alias Gfinancas.Finance.Receitas

  @doc """
  Returns the list of receita.

  ## Examples

      iex> list_receita()
      [%Receitas{}, ...]

  """
  def list_receita do
    Repo.all(Receitas)
  end

  @doc """
  Gets a single receitas.

  Raises `Ecto.NoResultsError` if the Receitas does not exist.

  ## Examples

      iex> get_receitas!(123)
      %Receitas{}

      iex> get_receitas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receitas!(id), do: Repo.get!(Receitas, id)

  @doc """
  Creates a receitas.

  ## Examples

      iex> create_receitas(%{field: value})
      {:ok, %Receitas{}}

      iex> create_receitas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receitas(attrs \\ %{}) do
    %Receitas{}
    |> Receitas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receitas.

  ## Examples

      iex> update_receitas(receitas, %{field: new_value})
      {:ok, %Receitas{}}

      iex> update_receitas(receitas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receitas(%Receitas{} = receitas, attrs) do
    receitas
    |> Receitas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receitas.

  ## Examples

      iex> delete_receitas(receitas)
      {:ok, %Receitas{}}

      iex> delete_receitas(receitas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receitas(%Receitas{} = receitas) do
    Repo.delete(receitas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receitas changes.

  ## Examples

      iex> change_receitas(receitas)
      %Ecto.Changeset{data: %Receitas{}}

  """
  def change_receitas(%Receitas{} = receitas, attrs \\ %{}) do
    Receitas.changeset(receitas, attrs)
  end

  alias Gfinancas.Finance.Receita

  @doc """
  Returns the list of receitas.

  ## Examples

      iex> list_receitas()
      [%Receita{}, ...]

  """
  def list_receitas do
    Repo.all(Receita)
  end

  @doc """
  Gets a single receita.

  Raises `Ecto.NoResultsError` if the Receita does not exist.

  ## Examples

      iex> get_receita!(123)
      %Receita{}

      iex> get_receita!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receita!(id), do: Repo.get!(Receita, id)

  @doc """
  Creates a receita.

  ## Examples

      iex> create_receita(%{field: value})
      {:ok, %Receita{}}

      iex> create_receita(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receita(attrs \\ %{}) do
    %Receita{}
    |> Receita.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receita.

  ## Examples

      iex> update_receita(receita, %{field: new_value})
      {:ok, %Receita{}}

      iex> update_receita(receita, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receita(%Receita{} = receita, attrs) do
    receita
    |> Receita.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receita.

  ## Examples

      iex> delete_receita(receita)
      {:ok, %Receita{}}

      iex> delete_receita(receita)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receita(%Receita{} = receita) do
    Repo.delete(receita)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receita changes.

  ## Examples

      iex> change_receita(receita)
      %Ecto.Changeset{data: %Receita{}}

  """
  def change_receita(%Receita{} = receita, attrs \\ %{}) do
    Receita.changeset(receita, attrs)
  end

  alias Gfinancas.Finance.Despesas

  @doc """
  Returns the list of despesa.

  ## Examples

      iex> list_despesa()
      [%Despesas{}, ...]

  """
  def list_despesa do
    Repo.all(Despesas)
  end

  @doc """
  Gets a single despesas.

  Raises `Ecto.NoResultsError` if the Despesas does not exist.

  ## Examples

      iex> get_despesas!(123)
      %Despesas{}

      iex> get_despesas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_despesas!(id), do: Repo.get!(Despesas, id)

  @doc """
  Creates a despesas.

  ## Examples

      iex> create_despesas(%{field: value})
      {:ok, %Despesas{}}

      iex> create_despesas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_despesas(attrs \\ %{}) do
    %Despesas{}
    |> Despesas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a despesas.

  ## Examples

      iex> update_despesas(despesas, %{field: new_value})
      {:ok, %Despesas{}}

      iex> update_despesas(despesas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_despesas(%Despesas{} = despesas, attrs) do
    despesas
    |> Despesas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a despesas.

  ## Examples

      iex> delete_despesas(despesas)
      {:ok, %Despesas{}}

      iex> delete_despesas(despesas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_despesas(%Despesas{} = despesas) do
    Repo.delete(despesas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking despesas changes.

  ## Examples

      iex> change_despesas(despesas)
      %Ecto.Changeset{data: %Despesas{}}

  """
  def change_despesas(%Despesas{} = despesas, attrs \\ %{}) do
    Despesas.changeset(despesas, attrs)
  end

  alias Gfinancas.Finance.Despesa

  @doc """
  Returns the list of despesas.

  ## Examples

      iex> list_despesas()
      [%Despesa{}, ...]

  """
  def list_despesas do
    Repo.all(Despesa)
  end

  @doc """
  Gets a single despesa.

  Raises `Ecto.NoResultsError` if the Despesa does not exist.

  ## Examples

      iex> get_despesa!(123)
      %Despesa{}

      iex> get_despesa!(456)
      ** (Ecto.NoResultsError)

  """
  def get_despesa!(id), do: Repo.get!(Despesa, id)

  @doc """
  Creates a despesa.

  ## Examples

      iex> create_despesa(%{field: value})
      {:ok, %Despesa{}}

      iex> create_despesa(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_despesa(attrs \\ %{}) do
    %Despesa{}
    |> Despesa.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a despesa.

  ## Examples

      iex> update_despesa(despesa, %{field: new_value})
      {:ok, %Despesa{}}

      iex> update_despesa(despesa, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_despesa(%Despesa{} = despesa, attrs) do
    despesa
    |> Despesa.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a despesa.

  ## Examples

      iex> delete_despesa(despesa)
      {:ok, %Despesa{}}

      iex> delete_despesa(despesa)
      {:error, %Ecto.Changeset{}}

  """
  def delete_despesa(%Despesa{} = despesa) do
    Repo.delete(despesa)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking despesa changes.

  ## Examples

      iex> change_despesa(despesa)
      %Ecto.Changeset{data: %Despesa{}}

  """
  def change_despesa(%Despesa{} = despesa, attrs \\ %{}) do
    Despesa.changeset(despesa, attrs)
  end
end
