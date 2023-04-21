defmodule ApiOficinaElx.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias ApiOficinaElx.Repo

  alias ApiOficinaElx.Accounts.User

  def create_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def get(%{"email" => email}) do
    query = from u in User, where: u.email == ^email

    case Repo.one(query) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def get(%{"nick_name" => nick_name}) do
    query = from u in User, where: u.nick_name == ^nick_name

    case Repo.one(query) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def get!(id) do
    User
    |> Repo.get!(id)
  end

  def authenticate_user(nick_name, password) do
    with {:ok, user} <- get(%{"nick_name" => nick_name}) do
      case validate_password(password, user.password) do
        false -> {:error, :unauthorized}
        true -> {:ok, user}
      end
    end
  end

  defp validate_password(password, encrypted_password) do
    Bcrypt.verify_pass(password, encrypted_password)
  end
end
