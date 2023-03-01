defmodule ApiOficinaElxWeb.MaterialCompradoView do
  use ApiOficinaElxWeb, :view
  alias ApiOficinaElxWeb.MaterialCompradoView

  def render("index.json", %{material_comprados: material_comprados}) do
    %{data: render_many(material_comprados, MaterialCompradoView, "material_comprado.json")}
  end

  def render("show.json", %{material_comprado: material_comprado}) do
    %{data: render_one(material_comprado, MaterialCompradoView, "material_comprado.json")}
  end

  def render("material_comprado.json", %{material_comprado: material_comprado}) do
    %{
      id: material_comprado.id,
      nome: material_comprado.nome,
      dia: material_comprado.dia,
      preco: material_comprado.preco
    }
  end
end
