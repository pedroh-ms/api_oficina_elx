defmodule ApiOficinaElxWeb.ServicoView do
  use ApiOficinaElxWeb, :view
  alias ApiOficinaElxWeb.ServicoView

  def render("index.json", %{servicos: servicos}) do
    %{data: render_many(servicos, ServicoView, "servico.json")}
  end

  def render("show.json", %{servico: servico}) do
    %{data: render_one(servico, ServicoView, "servico.json")}
  end

  def render("servico.json", %{servico: servico}) do
    %{
      id: servico.id,
      dono_id: servico.dono_id,
      carro_id: servico.carro_id,
      data_entrega: servico.data_entrega,
      preco: servico.preco,
      observacao: servico.observacao
    }
  end
end
