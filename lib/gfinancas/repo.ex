defmodule Gfinancas.Repo do
  use Ecto.Repo,
    otp_app: :gfinancas,
    adapter: Ecto.Adapters.Postgres
end
