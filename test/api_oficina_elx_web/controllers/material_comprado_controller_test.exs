defmodule ApiOficinaElxWeb.MaterialCompradoControllerTest do
  use ApiOficinaElxWeb.ConnCase

  import ApiOficinaElx.OficinaFixtures

  alias ApiOficinaElx.Oficina.MaterialComprado

  @create_attrs %{
    dia: ~D[2022-12-01],
    nome: "some nome",
    preco: "120.5"
  }
  @update_attrs %{
    dia: ~D[2022-12-02],
    nome: "some updated nome",
    preco: "456.7"
  }
  @invalid_attrs %{dia: nil, nome: nil, preco: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all material_comprados", %{conn: conn} do
      conn = get(conn, Routes.material_comprado_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create material_comprado" do
    test "renders material_comprado when data is valid", %{conn: conn} do
      conn = post(conn, Routes.material_comprado_path(conn, :create), material_comprado: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.material_comprado_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "dia" => "2022-12-01",
               "nome" => "some nome",
               "preco" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.material_comprado_path(conn, :create), material_comprado: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update material_comprado" do
    setup [:create_material_comprado]

    test "renders material_comprado when data is valid", %{conn: conn, material_comprado: %MaterialComprado{id: id} = material_comprado} do
      conn = put(conn, Routes.material_comprado_path(conn, :update, material_comprado), material_comprado: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.material_comprado_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "dia" => "2022-12-02",
               "nome" => "some updated nome",
               "preco" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, material_comprado: material_comprado} do
      conn = put(conn, Routes.material_comprado_path(conn, :update, material_comprado), material_comprado: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete material_comprado" do
    setup [:create_material_comprado]

    test "deletes chosen material_comprado", %{conn: conn, material_comprado: material_comprado} do
      conn = delete(conn, Routes.material_comprado_path(conn, :delete, material_comprado))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.material_comprado_path(conn, :show, material_comprado))
      end
    end
  end

  defp create_material_comprado(_) do
    material_comprado = material_comprado_fixture()
    %{material_comprado: material_comprado}
  end
end
