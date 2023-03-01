defmodule ApiOficinaElxWeb.CarroController do
  use ApiOficinaElxWeb, :controller

  alias ApiOficinaElx.Oficina
  alias ApiOficinaElx.Oficina.Carro

  action_fallback ApiOficinaElxWeb.FallbackController

  def index(conn, _params) do
    carros = Oficina.list_carros()
    render(conn, "index.json", carros: carros)
  end

  def create(conn, %{"carro" => carro_params}) do
    with {:ok, %Carro{} = carro} <- Oficina.create_carro(carro_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.carro_path(conn, :show, carro))
      |> render("show.json", carro: carro)
    end
  end

  def show(conn, %{"id" => id}) do
    carro = Oficina.get_carro!(id)
    render(conn, "show.json", carro: carro)
  end

  def update(conn, %{"id" => id, "carro" => carro_params}) do
    carro = Oficina.get_carro!(id)

    with {:ok, %Carro{} = carro} <- Oficina.update_carro(carro, carro_params) do
      render(conn, "show.json", carro: carro)
    end
  end

  def delete(conn, %{"id" => id}) do
    carro = Oficina.get_carro!(id)

    with {:ok, %Carro{}} <- Oficina.delete_carro(carro) do
      send_resp(conn, :no_content, "")
    end
  end
end
