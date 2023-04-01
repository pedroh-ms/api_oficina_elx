defmodule ApiOficinaElxWeb.ServicoView do
  use ApiOficinaElxWeb, :view
  alias ApiOficinaElxWeb.ServicoView

  def render("indexdc.json", %{servicos: servicos}) do
    %{data: render_many(servicos, ServicoView, "servicodc.json")}
  end

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

  def render("servicodc.json", %{servico: servico}) do
    %{
      id: servico.id,
      dono: %{
        id: servico.dono.id,
        nome: servico.dono.nome,
        numero_celular: servico.dono.numero_celular
      },
      carro: %{
        id: servico.carro.id,
        nome: servico.carro.nome,
        cor: servico.carro.cor,
        dono_id: servico.carro.dono_id
      },
      data_entrega: servico.data_entrega,
      preco: servico.preco,
      observacao: servico.observacao
    }
  end
end
