defmodule ApiOficinaElxWeb.CarroView do
  use ApiOficinaElxWeb, :view
  alias ApiOficinaElxWeb.CarroView

  def render("index.json", %{carros: carros}) do
    %{data: render_many(carros, CarroView, "carro.json")}
  end

  def render("indexdonos.json", %{carros: carros}) do
    %{data: render_many(carros, CarroView, "carrodono.json")}
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

  def render("carrodono.json", %{carro: carro}) do
    %{
      id: carro.id,
      dono: %{
        id: carro.dono.id,
        nome: carro.dono.nome,
        numero_celular: carro.dono.numero_celular
      },
      nome: carro.nome,
      cor: carro.cor
    }
  end
end
