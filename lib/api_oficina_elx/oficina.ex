defmodule ApiOficinaElx.Oficina do
  @moduledoc """
  The Oficina context.
  """

  import Ecto.Query, warn: false
  alias ApiOficinaElx.Repo

  alias ApiOficinaElx.Oficina.Dono

  @doc """
  Returns the list of donos where `Dono.nome` is like `nome`

  ## Examples

      iex> list_donos()
      [%Dono{}, ...]

  """
  def list_donos(%{"nome" => nome}) do
    like = "%#{nome}%"
    query = from d in Dono, where: like(d.nome, ^like)

    Repo.all(query)
  end

  @doc """
  Returns the list of donos.

  ## Examples

      iex> list_donos()
      [%Dono{}, ...]

  """
  def list_donos do
    Repo.all(Dono)
  end

  @doc """
  Gets a single dono.

  Raises `Ecto.NoResultsError` if the Dono does not exist.

  ## Examples

      iex> get_dono!(123)
      %Dono{}

      iex> get_dono!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dono!(id), do: Repo.get!(Dono, id)

  @doc """
  Creates a dono.

  ## Examples

      iex> create_dono(%{field: value})
      {:ok, %Dono{}}

      iex> create_dono(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dono(attrs \\ %{}) do
    %Dono{}
    |> Dono.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dono.

  ## Examples

      iex> update_dono(dono, %{field: new_value})
      {:ok, %Dono{}}

      iex> update_dono(dono, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dono(%Dono{} = dono, attrs) do
    dono
    |> Dono.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dono.

  ## Examples

      iex> delete_dono(dono)
      {:ok, %Dono{}}

      iex> delete_dono(dono)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dono(%Dono{} = dono) do
    Repo.delete(dono)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dono changes.

  ## Examples

      iex> change_dono(dono)
      %Ecto.Changeset{data: %Dono{}}

  """
  def change_dono(%Dono{} = dono, attrs \\ %{}) do
    Dono.changeset(dono, attrs)
  end

  alias ApiOficinaElx.Oficina.Carro

  @doc """
  Returns the list of carros.

  ## Examples

      iex> list_carros()
      [%Carro{}, ...]

  """
  def list_carros("with_donos") do
    query = from c in Carro,
      join: d in Dono,
      on: d.id == c.dono_id,
      select: %{
        id: c.id,
        nome: c.nome,
        cor: c.cor,
        dono: d
      }

    Repo.all(query)
  end

  @doc """
  Returns the list of carros.

  ## Examples

      iex> list_carros()
      [%Carro{}, ...]

  """
  def list_carros do
    Repo.all(Carro)
  end

  @doc """
  Gets a single carro.

  Raises `Ecto.NoResultsError` if the Carro does not exist.

  ## Examples

      iex> get_carro!(123)
      %Carro{}

      iex> get_carro!(456)
      ** (Ecto.NoResultsError)

  """
  def get_carro!(id), do: Repo.get!(Carro, id)

  @doc """
  Creates a carro.

  ## Examples

      iex> create_carro(%{field: value})
      {:ok, %Carro{}}

      iex> create_carro(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_carro(attrs \\ %{}) do
    %Carro{}
    |> Carro.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a carro.

  ## Examples

      iex> update_carro(carro, %{field: new_value})
      {:ok, %Carro{}}

      iex> update_carro(carro, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_carro(%Carro{} = carro, attrs) do
    carro
    |> Carro.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a carro.

  ## Examples

      iex> delete_carro(carro)
      {:ok, %Carro{}}

      iex> delete_carro(carro)
      {:error, %Ecto.Changeset{}}

  """
  def delete_carro(%Carro{} = carro) do
    Repo.delete(carro)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking carro changes.

  ## Examples

      iex> change_carro(carro)
      %Ecto.Changeset{data: %Carro{}}

  """
  def change_carro(%Carro{} = carro, attrs \\ %{}) do
    Carro.changeset(carro, attrs)
  end

  alias ApiOficinaElx.Oficina.Servico

  @doc """
  Returns the list of servicos.

  ## Examples

      iex> list_servicos()
      [%Servico{}, ...]

  """
  def list_servicos do
    Repo.all(Servico)
  end

  @doc """
  Gets a single servico.

  Raises `Ecto.NoResultsError` if the Servico does not exist.

  ## Examples

      iex> get_servico!(123)
      %Servico{}

      iex> get_servico!(456)
      ** (Ecto.NoResultsError)

  """
  def get_servico!(id), do: Repo.get!(Servico, id)

  @doc """
  Creates a servico.

  ## Examples

      iex> create_servico(%{field: value})
      {:ok, %Servico{}}

      iex> create_servico(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_servico(attrs \\ %{}) do
    %Servico{}
    |> Servico.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a servico.

  ## Examples

      iex> update_servico(servico, %{field: new_value})
      {:ok, %Servico{}}

      iex> update_servico(servico, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_servico(%Servico{} = servico, attrs) do
    servico
    |> Servico.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a servico.

  ## Examples

      iex> delete_servico(servico)
      {:ok, %Servico{}}

      iex> delete_servico(servico)
      {:error, %Ecto.Changeset{}}

  """
  def delete_servico(%Servico{} = servico) do
    Repo.delete(servico)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking servico changes.

  ## Examples

      iex> change_servico(servico)
      %Ecto.Changeset{data: %Servico{}}

  """
  def change_servico(%Servico{} = servico, attrs \\ %{}) do
    Servico.changeset(servico, attrs)
  end

  alias ApiOficinaElx.Oficina.MaterialComprado

  @doc """
  Returns the list of material_comprados.

  ## Examples

      iex> list_material_comprados()
      [%MaterialComprado{}, ...]

  """
  def list_material_comprados do
    Repo.all(MaterialComprado)
  end

  @doc """
  Gets a single material_comprado.

  Raises `Ecto.NoResultsError` if the Material comprado does not exist.

  ## Examples

      iex> get_material_comprado!(123)
      %MaterialComprado{}

      iex> get_material_comprado!(456)
      ** (Ecto.NoResultsError)

  """
  def get_material_comprado!(id), do: Repo.get!(MaterialComprado, id)

  @doc """
  Creates a material_comprado.

  ## Examples

      iex> create_material_comprado(%{field: value})
      {:ok, %MaterialComprado{}}

      iex> create_material_comprado(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_material_comprado(attrs \\ %{}) do
    %MaterialComprado{}
    |> MaterialComprado.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a material_comprado.

  ## Examples

      iex> update_material_comprado(material_comprado, %{field: new_value})
      {:ok, %MaterialComprado{}}

      iex> update_material_comprado(material_comprado, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_material_comprado(%MaterialComprado{} = material_comprado, attrs) do
    material_comprado
    |> MaterialComprado.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a material_comprado.

  ## Examples

      iex> delete_material_comprado(material_comprado)
      {:ok, %MaterialComprado{}}

      iex> delete_material_comprado(material_comprado)
      {:error, %Ecto.Changeset{}}

  """
  def delete_material_comprado(%MaterialComprado{} = material_comprado) do
    Repo.delete(material_comprado)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking material_comprado changes.

  ## Examples

      iex> change_material_comprado(material_comprado)
      %Ecto.Changeset{data: %MaterialComprado{}}

  """
  def change_material_comprado(%MaterialComprado{} = material_comprado, attrs \\ %{}) do
    MaterialComprado.changeset(material_comprado, attrs)
  end
end
