defmodule ApiOficinaElx.Guardian do
  use Guardian, otp_app: :api_oficina_elx
  alias ApiOficinaElx.Accounts

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get!(id)
    {:ok, resource}
  end
end
