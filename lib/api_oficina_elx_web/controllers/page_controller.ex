defmodule ApiOficinaElxWeb.PageController do
  use ApiOficinaElxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
