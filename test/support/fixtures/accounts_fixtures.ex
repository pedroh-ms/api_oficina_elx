defmodule ApiOficinaElx.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiOficinaElx.Accounts` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique user nick_name.
  """
  def unique_user_nick_name, do: "some nick_name#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        nick_name: unique_user_nick_name(),
        password: "some password"
      })
      |> ApiOficinaElx.Accounts.create_user()

    user
  end
end
