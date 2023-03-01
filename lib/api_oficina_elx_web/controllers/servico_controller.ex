defmodule ApiOficinaElxWeb.ServicoController do
  use ApiOficinaElxWeb, :controller

  alias ApiOficinaElx.Oficina
  alias ApiOficinaElx.Oficina.Servico

  action_fallback ApiOficinaElxWeb.FallbackController

  def index(conn, _params) do
    servicos = Oficina.list_servicos()
    render(conn, "index.json", servicos: servicos)
  end

  def create(conn, %{"servico" => servico_params}) do
    with {:ok, %Servico{} = servico} <- Oficina.create_servico(servico_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.servico_path(conn, :show, servico))
      |> render("show.json", servico: servico)
    end
  end

  def show(conn, %{"id" => id}) do
    servico = Oficina.get_servico!(id)
    render(conn, "show.json", servico: servico)
  end

  def update(conn, %{"id" => id, "servico" => servico_params}) do
    servico = Oficina.get_servico!(id)

    with {:ok, %Servico{} = servico} <- Oficina.update_servico(servico, servico_params) do
      render(conn, "show.json", servico: servico)
    end
  end

  def delete(conn, %{"id" => id}) do
    servico = Oficina.get_servico!(id)

    with {:ok, %Servico{}} <- Oficina.delete_servico(servico) do
      send_resp(conn, :no_content, "")
    end
  end
end
