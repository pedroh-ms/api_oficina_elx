defmodule ApiOficinaElxWeb.UserController do
  use ApiOficinaElxWeb, :controller

  alias ApiOficinaElx.Accounts
  alias ApiOficinaElx.Accounts.User

  action_fallback ApiOficinaElxWeb.FallbackController

  def register(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end
end
