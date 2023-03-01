defmodule ApiOficinaElxWeb.MaterialCompradoController do
  use ApiOficinaElxWeb, :controller

  alias ApiOficinaElx.Oficina
  alias ApiOficinaElx.Oficina.MaterialComprado

  action_fallback ApiOficinaElxWeb.FallbackController

  def index(conn, _params) do
    material_comprados = Oficina.list_material_comprados()
    render(conn, "index.json", material_comprados: material_comprados)
  end

  def create(conn, %{"material_comprado" => material_comprado_params}) do
    with {:ok, %MaterialComprado{} = material_comprado} <- Oficina.create_material_comprado(material_comprado_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.material_comprado_path(conn, :show, material_comprado))
      |> render("show.json", material_comprado: material_comprado)
    end
  end

  def show(conn, %{"id" => id}) do
    material_comprado = Oficina.get_material_comprado!(id)
    render(conn, "show.json", material_comprado: material_comprado)
  end

  def update(conn, %{"id" => id, "material_comprado" => material_comprado_params}) do
    material_comprado = Oficina.get_material_comprado!(id)

    with {:ok, %MaterialComprado{} = material_comprado} <- Oficina.update_material_comprado(material_comprado, material_comprado_params) do
      render(conn, "show.json", material_comprado: material_comprado)
    end
  end

  def delete(conn, %{"id" => id}) do
    material_comprado = Oficina.get_material_comprado!(id)

    with {:ok, %MaterialComprado{}} <- Oficina.delete_material_comprado(material_comprado) do
      send_resp(conn, :no_content, "")
    end
  end
end
