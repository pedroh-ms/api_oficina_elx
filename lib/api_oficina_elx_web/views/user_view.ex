defmodule ApiOficinaElxWeb.UserView do
  use ApiOficinaElxWeb, :view
  alias ApiOficinaElxWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      nick_name: user.nick_name,
      email: user.email,
      password: user.password
    }
  end
end
