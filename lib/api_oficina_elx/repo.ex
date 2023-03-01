defmodule ApiOficinaElx.Repo do
  use Ecto.Repo,
    otp_app: :api_oficina_elx,
    adapter: Ecto.Adapters.MyXQL
end
