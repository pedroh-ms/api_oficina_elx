defmodule ApiOficinaElxWeb.ServicoControllerTest do
  use ApiOficinaElxWeb.ConnCase

  import ApiOficinaElx.OficinaFixtures

  alias ApiOficinaElx.Oficina.Servico

  @create_attrs %{
    data_entrega: ~D[2022-12-01],
    observacao: "some observacao",
    preco: "120.5"
  }
  @update_attrs %{
    data_entrega: ~D[2022-12-02],
    observacao: "some updated observacao",
    preco: "456.7"
  }
  @invalid_attrs %{data_entrega: nil, observacao: nil, preco: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all servicos", %{conn: conn} do
      conn = get(conn, Routes.servico_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create servico" do
    test "renders servico when data is valid", %{conn: conn} do
      conn = post(conn, Routes.servico_path(conn, :create), servico: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.servico_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "data_entrega" => "2022-12-01",
               "observacao" => "some observacao",
               "preco" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.servico_path(conn, :create), servico: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update servico" do
    setup [:create_servico]

    test "renders servico when data is valid", %{conn: conn, servico: %Servico{id: id} = servico} do
      conn = put(conn, Routes.servico_path(conn, :update, servico), servico: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.servico_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "data_entrega" => "2022-12-02",
               "observacao" => "some updated observacao",
               "preco" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, servico: servico} do
      conn = put(conn, Routes.servico_path(conn, :update, servico), servico: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete servico" do
    setup [:create_servico]

    test "deletes chosen servico", %{conn: conn, servico: servico} do
      conn = delete(conn, Routes.servico_path(conn, :delete, servico))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.servico_path(conn, :show, servico))
      end
    end
  end

  defp create_servico(_) do
    servico = servico_fixture()
    %{servico: servico}
  end
end
