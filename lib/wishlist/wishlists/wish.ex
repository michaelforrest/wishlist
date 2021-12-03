defmodule Wishlist.Wishlists.Wish do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wishes" do
    field :image_url, :string
    field :name, :string
    field :order, :integer
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(wish, attrs) do
    wish
    |> cast(attrs, [:name, :order, :url, :image_url])
    |> validate_required([])
  end
end
