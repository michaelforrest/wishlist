defmodule Wishlist.WishlistsTest do
  use Wishlist.DataCase

  alias Wishlist.Wishlists

  describe "wishes" do
    alias Wishlist.Wishlists.Wish

    @valid_attrs %{image_url: "some image_url", name: "some name", order: 42, url: "some url"}
    @update_attrs %{image_url: "some updated image_url", name: "some updated name", order: 43, url: "some updated url"}
    @invalid_attrs %{image_url: nil, name: nil, order: nil, url: nil}

    def wish_fixture(attrs \\ %{}) do
      {:ok, wish} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wishlists.create_wish()

      wish
    end

    test "list_wishes/0 returns all wishes" do
      wish = wish_fixture()
      assert Wishlists.list_wishes() == [wish]
    end

    test "get_wish!/1 returns the wish with given id" do
      wish = wish_fixture()
      assert Wishlists.get_wish!(wish.id) == wish
    end

    test "create_wish/1 with valid data creates a wish" do
      assert {:ok, %Wish{} = wish} = Wishlists.create_wish(@valid_attrs)
      assert wish.image_url == "some image_url"
      assert wish.name == "some name"
      assert wish.order == 42
      assert wish.url == "some url"
    end

    test "create_wish/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wishlists.create_wish(@invalid_attrs)
    end

    test "update_wish/2 with valid data updates the wish" do
      wish = wish_fixture()
      assert {:ok, %Wish{} = wish} = Wishlists.update_wish(wish, @update_attrs)
      assert wish.image_url == "some updated image_url"
      assert wish.name == "some updated name"
      assert wish.order == 43
      assert wish.url == "some updated url"
    end

    test "update_wish/2 with invalid data returns error changeset" do
      wish = wish_fixture()
      assert {:error, %Ecto.Changeset{}} = Wishlists.update_wish(wish, @invalid_attrs)
      assert wish == Wishlists.get_wish!(wish.id)
    end

    test "delete_wish/1 deletes the wish" do
      wish = wish_fixture()
      assert {:ok, %Wish{}} = Wishlists.delete_wish(wish)
      assert_raise Ecto.NoResultsError, fn -> Wishlists.get_wish!(wish.id) end
    end

    test "change_wish/1 returns a wish changeset" do
      wish = wish_fixture()
      assert %Ecto.Changeset{} = Wishlists.change_wish(wish)
    end
  end
end
