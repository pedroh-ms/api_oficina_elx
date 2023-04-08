defmodule ApiOficinaElx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :nick_name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nick_name, :email, :password])
    |> validate_required([:nick_name, :email, :password])
    |> unique_constraint(:email)
    |> unique_constraint(:nick_name)
  end

  @doc false
  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:nick_name, :email, :password])
    |> validate_required([:nick_name, :email, :password])
    |> unique_constraint(:email)
    |> unique_constraint(:nick_name)
    |> encrypt_and_put_password()
  end

  defp encrypt_and_put_password(user) do
    with password <- fetch_field!(user, :password) do
      encrypted_password = Bcrypt.Base.hash_password(password, Bcrypt.Base.gen_salt(12, true))
      put_change(user, :password, encrypted_password)
    end
  end
end
