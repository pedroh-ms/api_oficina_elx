defmodule ApiOficinaElxWeb.SessionView do
  use ApiOficinaElxWeb, :view

  def render("token.json", %{access_token: access_token}) do
    %{access_token: access_token}
  end
end
