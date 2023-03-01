defmodule ApiOficinaElxWeb.DonoController do
  use ApiOficinaElxWeb, :controller

  alias ApiOficinaElx.Oficina
  alias ApiOficinaElx.Oficina.Dono

  action_fallback ApiOficinaElxWeb.FallbackController

  def index(conn, %{"nome" => _} = params) do
    donos = Oficina.list_donos(params)
    render(conn, "index.json", donos: donos)
  end
  
  def index(conn, _params) do
    donos = Oficina.list_donos()
    render(conn, "index.json", donos: donos)
  end

  def create(conn, %{"dono" => dono_params}) do
    with {:ok, %Dono{} = dono} <- Oficina.create_dono(dono_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.dono_path(conn, :show, dono))
      |> render("show.json", dono: dono)
    end
  end

  def show(conn, %{"id" => id}) do
    dono = Oficina.get_dono!(id)
    render(conn, "show.json", dono: dono)
  end

  def update(conn, %{"id" => id, "dono" => dono_params}) do
    dono = Oficina.get_dono!(id)

    with {:ok, %Dono{} = dono} <- Oficina.update_dono(dono, dono_params) do
      render(conn, "show.json", dono: dono)
    end
  end

  def delete(conn, %{"id" => id}) do
    dono = Oficina.get_dono!(id)

    with {:ok, %Dono{}} <- Oficina.delete_dono(dono) do
      send_resp(conn, :no_content, "")
    end
  end
end
