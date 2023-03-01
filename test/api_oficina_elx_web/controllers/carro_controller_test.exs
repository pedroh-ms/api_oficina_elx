defmodule ApiOficinaElxWeb.CarroControllerTest do
  use ApiOficinaElxWeb.ConnCase

  import ApiOficinaElx.OficinaFixtures

  alias ApiOficinaElx.Oficina.Carro

  @create_attrs %{
    cor: "some cor",
    nome: "some nome"
  }
  @update_attrs %{
    cor: "some updated cor",
    nome: "some updated nome"
  }
  @invalid_attrs %{cor: nil, nome: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all carros", %{conn: conn} do
      conn = get(conn, Routes.carro_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create carro" do
    test "renders carro when data is valid", %{conn: conn} do
      conn = post(conn, Routes.carro_path(conn, :create), carro: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.carro_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cor" => "some cor",
               "nome" => "some nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.carro_path(conn, :create), carro: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update carro" do
    setup [:create_carro]

    test "renders carro when data is valid", %{conn: conn, carro: %Carro{id: id} = carro} do
      conn = put(conn, Routes.carro_path(conn, :update, carro), carro: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.carro_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cor" => "some updated cor",
               "nome" => "some updated nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, carro: carro} do
      conn = put(conn, Routes.carro_path(conn, :update, carro), carro: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete carro" do
    setup [:create_carro]

    test "deletes chosen carro", %{conn: conn, carro: carro} do
      conn = delete(conn, Routes.carro_path(conn, :delete, carro))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.carro_path(conn, :show, carro))
      end
    end
  end

  defp create_carro(_) do
    carro = carro_fixture()
    %{carro: carro}
  end
end
