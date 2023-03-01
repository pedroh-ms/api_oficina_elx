defmodule ApiOficinaElx.OficinaTest do
  use ApiOficinaElx.DataCase

  alias ApiOficinaElx.Oficina

  describe "donos" do
    alias ApiOficinaElx.Oficina.Dono

    import ApiOficinaElx.OficinaFixtures

    @invalid_attrs %{nome: nil, numero_celular: nil}

    test "list_donos/0 returns all donos" do
      dono = dono_fixture()
      assert Oficina.list_donos() == [dono]
    end

    test "get_dono!/1 returns the dono with given id" do
      dono = dono_fixture()
      assert Oficina.get_dono!(dono.id) == dono
    end

    test "create_dono/1 with valid data creates a dono" do
      valid_attrs = %{nome: "some nome", numero_celular: 42}

      assert {:ok, %Dono{} = dono} = Oficina.create_dono(valid_attrs)
      assert dono.nome == "some nome"
      assert dono.numero_celular == 42
    end

    test "create_dono/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Oficina.create_dono(@invalid_attrs)
    end

    test "update_dono/2 with valid data updates the dono" do
      dono = dono_fixture()
      update_attrs = %{nome: "some updated nome", numero_celular: 43}

      assert {:ok, %Dono{} = dono} = Oficina.update_dono(dono, update_attrs)
      assert dono.nome == "some updated nome"
      assert dono.numero_celular == 43
    end

    test "update_dono/2 with invalid data returns error changeset" do
      dono = dono_fixture()
      assert {:error, %Ecto.Changeset{}} = Oficina.update_dono(dono, @invalid_attrs)
      assert dono == Oficina.get_dono!(dono.id)
    end

    test "delete_dono/1 deletes the dono" do
      dono = dono_fixture()
      assert {:ok, %Dono{}} = Oficina.delete_dono(dono)
      assert_raise Ecto.NoResultsError, fn -> Oficina.get_dono!(dono.id) end
    end

    test "change_dono/1 returns a dono changeset" do
      dono = dono_fixture()
      assert %Ecto.Changeset{} = Oficina.change_dono(dono)
    end
  end

  describe "carros" do
    alias ApiOficinaElx.Oficina.Carro

    import ApiOficinaElx.OficinaFixtures

    @invalid_attrs %{cor: nil, nome: nil}

    test "list_carros/0 returns all carros" do
      carro = carro_fixture()
      assert Oficina.list_carros() == [carro]
    end

    test "get_carro!/1 returns the carro with given id" do
      carro = carro_fixture()
      assert Oficina.get_carro!(carro.id) == carro
    end

    test "create_carro/1 with valid data creates a carro" do
      valid_attrs = %{cor: "some cor", nome: "some nome"}

      assert {:ok, %Carro{} = carro} = Oficina.create_carro(valid_attrs)
      assert carro.cor == "some cor"
      assert carro.nome == "some nome"
    end

    test "create_carro/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Oficina.create_carro(@invalid_attrs)
    end

    test "update_carro/2 with valid data updates the carro" do
      carro = carro_fixture()
      update_attrs = %{cor: "some updated cor", nome: "some updated nome"}

      assert {:ok, %Carro{} = carro} = Oficina.update_carro(carro, update_attrs)
      assert carro.cor == "some updated cor"
      assert carro.nome == "some updated nome"
    end

    test "update_carro/2 with invalid data returns error changeset" do
      carro = carro_fixture()
      assert {:error, %Ecto.Changeset{}} = Oficina.update_carro(carro, @invalid_attrs)
      assert carro == Oficina.get_carro!(carro.id)
    end

    test "delete_carro/1 deletes the carro" do
      carro = carro_fixture()
      assert {:ok, %Carro{}} = Oficina.delete_carro(carro)
      assert_raise Ecto.NoResultsError, fn -> Oficina.get_carro!(carro.id) end
    end

    test "change_carro/1 returns a carro changeset" do
      carro = carro_fixture()
      assert %Ecto.Changeset{} = Oficina.change_carro(carro)
    end
  end

  describe "servicos" do
    alias ApiOficinaElx.Oficina.Servico

    import ApiOficinaElx.OficinaFixtures

    @invalid_attrs %{data_entrega: nil, observacao: nil, preco: nil}

    test "list_servicos/0 returns all servicos" do
      servico = servico_fixture()
      assert Oficina.list_servicos() == [servico]
    end

    test "get_servico!/1 returns the servico with given id" do
      servico = servico_fixture()
      assert Oficina.get_servico!(servico.id) == servico
    end

    test "create_servico/1 with valid data creates a servico" do
      valid_attrs = %{data_entrega: ~D[2022-12-01], observacao: "some observacao", preco: "120.5"}

      assert {:ok, %Servico{} = servico} = Oficina.create_servico(valid_attrs)
      assert servico.data_entrega == ~D[2022-12-01]
      assert servico.observacao == "some observacao"
      assert servico.preco == Decimal.new("120.5")
    end

    test "create_servico/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Oficina.create_servico(@invalid_attrs)
    end

    test "update_servico/2 with valid data updates the servico" do
      servico = servico_fixture()
      update_attrs = %{data_entrega: ~D[2022-12-02], observacao: "some updated observacao", preco: "456.7"}

      assert {:ok, %Servico{} = servico} = Oficina.update_servico(servico, update_attrs)
      assert servico.data_entrega == ~D[2022-12-02]
      assert servico.observacao == "some updated observacao"
      assert servico.preco == Decimal.new("456.7")
    end

    test "update_servico/2 with invalid data returns error changeset" do
      servico = servico_fixture()
      assert {:error, %Ecto.Changeset{}} = Oficina.update_servico(servico, @invalid_attrs)
      assert servico == Oficina.get_servico!(servico.id)
    end

    test "delete_servico/1 deletes the servico" do
      servico = servico_fixture()
      assert {:ok, %Servico{}} = Oficina.delete_servico(servico)
      assert_raise Ecto.NoResultsError, fn -> Oficina.get_servico!(servico.id) end
    end

    test "change_servico/1 returns a servico changeset" do
      servico = servico_fixture()
      assert %Ecto.Changeset{} = Oficina.change_servico(servico)
    end
  end

  describe "material_comprados" do
    alias ApiOficinaElx.Oficina.MaterialComprado

    import ApiOficinaElx.OficinaFixtures

    @invalid_attrs %{dia: nil, nome: nil, preco: nil}

    test "list_material_comprados/0 returns all material_comprados" do
      material_comprado = material_comprado_fixture()
      assert Oficina.list_material_comprados() == [material_comprado]
    end

    test "get_material_comprado!/1 returns the material_comprado with given id" do
      material_comprado = material_comprado_fixture()
      assert Oficina.get_material_comprado!(material_comprado.id) == material_comprado
    end

    test "create_material_comprado/1 with valid data creates a material_comprado" do
      valid_attrs = %{dia: ~D[2022-12-01], nome: "some nome", preco: "120.5"}

      assert {:ok, %MaterialComprado{} = material_comprado} = Oficina.create_material_comprado(valid_attrs)
      assert material_comprado.dia == ~D[2022-12-01]
      assert material_comprado.nome == "some nome"
      assert material_comprado.preco == Decimal.new("120.5")
    end

    test "create_material_comprado/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Oficina.create_material_comprado(@invalid_attrs)
    end

    test "update_material_comprado/2 with valid data updates the material_comprado" do
      material_comprado = material_comprado_fixture()
      update_attrs = %{dia: ~D[2022-12-02], nome: "some updated nome", preco: "456.7"}

      assert {:ok, %MaterialComprado{} = material_comprado} = Oficina.update_material_comprado(material_comprado, update_attrs)
      assert material_comprado.dia == ~D[2022-12-02]
      assert material_comprado.nome == "some updated nome"
      assert material_comprado.preco == Decimal.new("456.7")
    end

    test "update_material_comprado/2 with invalid data returns error changeset" do
      material_comprado = material_comprado_fixture()
      assert {:error, %Ecto.Changeset{}} = Oficina.update_material_comprado(material_comprado, @invalid_attrs)
      assert material_comprado == Oficina.get_material_comprado!(material_comprado.id)
    end

    test "delete_material_comprado/1 deletes the material_comprado" do
      material_comprado = material_comprado_fixture()
      assert {:ok, %MaterialComprado{}} = Oficina.delete_material_comprado(material_comprado)
      assert_raise Ecto.NoResultsError, fn -> Oficina.get_material_comprado!(material_comprado.id) end
    end

    test "change_material_comprado/1 returns a material_comprado changeset" do
      material_comprado = material_comprado_fixture()
      assert %Ecto.Changeset{} = Oficina.change_material_comprado(material_comprado)
    end
  end
end
