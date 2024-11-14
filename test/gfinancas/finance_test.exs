defmodule Gfinancas.FinanceTest do
  use Gfinancas.DataCase

  alias Gfinancas.Finance

  describe "receita" do
    alias Gfinancas.Finance.Receitas

    import Gfinancas.FinanceFixtures

    @invalid_attrs %{data: nil, nome: nil, valor: nil}

    test "list_receita/0 returns all receita" do
      receitas = receitas_fixture()
      assert Finance.list_receita() == [receitas]
    end

    test "get_receitas!/1 returns the receitas with given id" do
      receitas = receitas_fixture()
      assert Finance.get_receitas!(receitas.id) == receitas
    end

    test "create_receitas/1 with valid data creates a receitas" do
      valid_attrs = %{data: ~D[2024-11-12], nome: "some nome", valor: "120.5"}

      assert {:ok, %Receitas{} = receitas} = Finance.create_receitas(valid_attrs)
      assert receitas.data == ~D[2024-11-12]
      assert receitas.nome == "some nome"
      assert receitas.valor == Decimal.new("120.5")
    end

    test "create_receitas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_receitas(@invalid_attrs)
    end

    test "update_receitas/2 with valid data updates the receitas" do
      receitas = receitas_fixture()
      update_attrs = %{data: ~D[2024-11-13], nome: "some updated nome", valor: "456.7"}

      assert {:ok, %Receitas{} = receitas} = Finance.update_receitas(receitas, update_attrs)
      assert receitas.data == ~D[2024-11-13]
      assert receitas.nome == "some updated nome"
      assert receitas.valor == Decimal.new("456.7")
    end

    test "update_receitas/2 with invalid data returns error changeset" do
      receitas = receitas_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_receitas(receitas, @invalid_attrs)
      assert receitas == Finance.get_receitas!(receitas.id)
    end

    test "delete_receitas/1 deletes the receitas" do
      receitas = receitas_fixture()
      assert {:ok, %Receitas{}} = Finance.delete_receitas(receitas)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_receitas!(receitas.id) end
    end

    test "change_receitas/1 returns a receitas changeset" do
      receitas = receitas_fixture()
      assert %Ecto.Changeset{} = Finance.change_receitas(receitas)
    end
  end

  describe "receitas" do
    alias Gfinancas.Finance.Receita

    import Gfinancas.FinanceFixtures

    @invalid_attrs %{data: nil, nome: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Finance.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Finance.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{data: ~D[2024-11-12], nome: "some nome", valor: "120.5"}

      assert {:ok, %Receita{} = receita} = Finance.create_receita(valid_attrs)
      assert receita.data == ~D[2024-11-12]
      assert receita.nome == "some nome"
      assert receita.valor == Decimal.new("120.5")
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{data: ~D[2024-11-13], nome: "some updated nome", valor: "456.7"}

      assert {:ok, %Receita{} = receita} = Finance.update_receita(receita, update_attrs)
      assert receita.data == ~D[2024-11-13]
      assert receita.nome == "some updated nome"
      assert receita.valor == Decimal.new("456.7")
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_receita(receita, @invalid_attrs)
      assert receita == Finance.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Finance.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Finance.change_receita(receita)
    end
  end

  describe "despesa" do
    alias Gfinancas.Finance.Despesas

    import Gfinancas.FinanceFixtures

    @invalid_attrs %{data: nil, nome: nil, valor: nil}

    test "list_despesa/0 returns all despesa" do
      despesas = despesas_fixture()
      assert Finance.list_despesa() == [despesas]
    end

    test "get_despesas!/1 returns the despesas with given id" do
      despesas = despesas_fixture()
      assert Finance.get_despesas!(despesas.id) == despesas
    end

    test "create_despesas/1 with valid data creates a despesas" do
      valid_attrs = %{data: ~D[2024-11-12], nome: "some nome", valor: "120.5"}

      assert {:ok, %Despesas{} = despesas} = Finance.create_despesas(valid_attrs)
      assert despesas.data == ~D[2024-11-12]
      assert despesas.nome == "some nome"
      assert despesas.valor == Decimal.new("120.5")
    end

    test "create_despesas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_despesas(@invalid_attrs)
    end

    test "update_despesas/2 with valid data updates the despesas" do
      despesas = despesas_fixture()
      update_attrs = %{data: ~D[2024-11-13], nome: "some updated nome", valor: "456.7"}

      assert {:ok, %Despesas{} = despesas} = Finance.update_despesas(despesas, update_attrs)
      assert despesas.data == ~D[2024-11-13]
      assert despesas.nome == "some updated nome"
      assert despesas.valor == Decimal.new("456.7")
    end

    test "update_despesas/2 with invalid data returns error changeset" do
      despesas = despesas_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_despesas(despesas, @invalid_attrs)
      assert despesas == Finance.get_despesas!(despesas.id)
    end

    test "delete_despesas/1 deletes the despesas" do
      despesas = despesas_fixture()
      assert {:ok, %Despesas{}} = Finance.delete_despesas(despesas)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_despesas!(despesas.id) end
    end

    test "change_despesas/1 returns a despesas changeset" do
      despesas = despesas_fixture()
      assert %Ecto.Changeset{} = Finance.change_despesas(despesas)
    end
  end

  describe "despesas" do
    alias Gfinancas.Finance.Despesa

    import Gfinancas.FinanceFixtures

    @invalid_attrs %{data: nil, nome: nil, valor: nil}

    test "list_despesas/0 returns all despesas" do
      despesa = despesa_fixture()
      assert Finance.list_despesas() == [despesa]
    end

    test "get_despesa!/1 returns the despesa with given id" do
      despesa = despesa_fixture()
      assert Finance.get_despesa!(despesa.id) == despesa
    end

    test "create_despesa/1 with valid data creates a despesa" do
      valid_attrs = %{data: ~D[2024-11-12], nome: "some nome", valor: "120.5"}

      assert {:ok, %Despesa{} = despesa} = Finance.create_despesa(valid_attrs)
      assert despesa.data == ~D[2024-11-12]
      assert despesa.nome == "some nome"
      assert despesa.valor == Decimal.new("120.5")
    end

    test "create_despesa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_despesa(@invalid_attrs)
    end

    test "update_despesa/2 with valid data updates the despesa" do
      despesa = despesa_fixture()
      update_attrs = %{data: ~D[2024-11-13], nome: "some updated nome", valor: "456.7"}

      assert {:ok, %Despesa{} = despesa} = Finance.update_despesa(despesa, update_attrs)
      assert despesa.data == ~D[2024-11-13]
      assert despesa.nome == "some updated nome"
      assert despesa.valor == Decimal.new("456.7")
    end

    test "update_despesa/2 with invalid data returns error changeset" do
      despesa = despesa_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_despesa(despesa, @invalid_attrs)
      assert despesa == Finance.get_despesa!(despesa.id)
    end

    test "delete_despesa/1 deletes the despesa" do
      despesa = despesa_fixture()
      assert {:ok, %Despesa{}} = Finance.delete_despesa(despesa)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_despesa!(despesa.id) end
    end

    test "change_despesa/1 returns a despesa changeset" do
      despesa = despesa_fixture()
      assert %Ecto.Changeset{} = Finance.change_despesa(despesa)
    end
  end
end
