defmodule Bookchain.Repo do
  use Ecto.Repo,
    otp_app: :bookchain,
    adapter: Ecto.Adapters.Postgres
end
