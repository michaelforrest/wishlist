defmodule Wishlist.Repo.Migrations.CreateWishes do
  use Ecto.Migration

  def change do
    create table(:wishes) do
      add :name, :string
      add :order, :integer
      add :url, :string
      add :image_url, :string

      timestamps()
    end

  end
end
