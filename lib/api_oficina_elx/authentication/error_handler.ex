defmodule ApiOficinaElx.Guardian.AuthErrorHandler do
  import Plug.Conn

  @behaviour Guardian.Plug.ErroHandler

  @impl Guardian.Plug.ErroHandler
  def auth_error(conn, {type, _reason}, _opts) do
    body = Jason.encode!(%{error: to_string(type)})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, body)
  end
end
