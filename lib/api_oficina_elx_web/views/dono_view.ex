defmodule ApiOficinaElxWeb.DonoView do
  use ApiOficinaElxWeb, :view
  alias ApiOficinaElxWeb.DonoView

  def render("index.json", %{donos: donos}) do
    %{data: render_many(donos, DonoView, "dono.json")}
  end

  def render("show.json", %{dono: dono}) do
    %{data: render_one(dono, DonoView, "dono.json")}
  end

  def render("dono.json", %{dono: dono}) do
    %{
      id: dono.id,
      nome: dono.nome,
      numero_celular: dono.numero_celular
    }
  end
end
