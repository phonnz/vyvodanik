defmodule Vyvodanik.Repo do
  use Ecto.Repo,
    otp_app: :vyvodanik,
    adapter: Ecto.Adapters.Postgres
end
