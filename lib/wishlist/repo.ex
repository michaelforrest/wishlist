defmodule Wishlist.Repo do
  use Ecto.Repo,
    otp_app: :wishlist,
    adapter: Ecto.Adapters.Postgres
end
