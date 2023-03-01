defmodule ApiOficinaElxWeb.DonoControllerTest do
  use ApiOficinaElxWeb.ConnCase

  import ApiOficinaElx.OficinaFixtures

  alias ApiOficinaElx.Oficina.Dono

  @create_attrs %{
    nome: "some nome",
    numero_celular: 42
  }
  @update_attrs %{
    nome: "some updated nome",
    numero_celular: 43
  }
  @invalid_attrs %{nome: nil, numero_celular: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all donos", %{conn: conn} do
      conn = get(conn, Routes.dono_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dono" do
    test "renders dono when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dono_path(conn, :create), dono: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.dono_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "nome" => "some nome",
               "numero_celular" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dono_path(conn, :create), dono: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dono" do
    setup [:create_dono]

    test "renders dono when data is valid", %{conn: conn, dono: %Dono{id: id} = dono} do
      conn = put(conn, Routes.dono_path(conn, :update, dono), dono: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.dono_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "nome" => "some updated nome",
               "numero_celular" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dono: dono} do
      conn = put(conn, Routes.dono_path(conn, :update, dono), dono: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dono" do
    setup [:create_dono]

    test "deletes chosen dono", %{conn: conn, dono: dono} do
      conn = delete(conn, Routes.dono_path(conn, :delete, dono))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.dono_path(conn, :show, dono))
      end
    end
  end

  defp create_dono(_) do
    dono = dono_fixture()
    %{dono: dono}
  end
end
