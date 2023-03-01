defmodule ApiOficinaElxWeb.CarroView do
  use ApiOficinaElxWeb, :view
  alias ApiOficinaElxWeb.CarroView

  def render("index.json", %{carros: carros}) do
    %{data: render_many(carros, CarroView, "carro.json")}
  end

  def render("show.json", %{carro: carro}) do
    %{data: render_one(carro, CarroView, "carro.json")}
  end

  def render("carro.json", %{carro: carro}) do
    %{
      id: carro.id,
      dono_id: carro.dono_id,
      nome: carro.nome,
      cor: carro.cor
    }
  end
end
