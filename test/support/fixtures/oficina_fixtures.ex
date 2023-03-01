defmodule ApiOficinaElx.OficinaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiOficinaElx.Oficina` context.
  """

  @doc """
  Generate a dono.
  """
  def dono_fixture(attrs \\ %{}) do
    {:ok, dono} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        numero_celular: 42
      })
      |> ApiOficinaElx.Oficina.create_dono()

    dono
  end

  @doc """
  Generate a carro.
  """
  def carro_fixture(attrs \\ %{}) do
    {:ok, carro} =
      attrs
      |> Enum.into(%{
        cor: "some cor",
        nome: "some nome"
      })
      |> ApiOficinaElx.Oficina.create_carro()

    carro
  end

  @doc """
  Generate a servico.
  """
  def servico_fixture(attrs \\ %{}) do
    {:ok, servico} =
      attrs
      |> Enum.into(%{
        data_entrega: ~D[2022-12-01],
        observacao: "some observacao",
        preco: "120.5"
      })
      |> ApiOficinaElx.Oficina.create_servico()

    servico
  end

  @doc """
  Generate a material_comprado.
  """
  def material_comprado_fixture(attrs \\ %{}) do
    {:ok, material_comprado} =
      attrs
      |> Enum.into(%{
        dia: ~D[2022-12-01],
        nome: "some nome",
        preco: "120.5"
      })
      |> ApiOficinaElx.Oficina.create_material_comprado()

    material_comprado
  end
end
