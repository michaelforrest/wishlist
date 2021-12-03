defmodule Wishlist.Wishlists do
  @moduledoc """
  The Wishlists context.
  """

  import Ecto.Query, warn: false
  alias Wishlist.Repo

  alias Wishlist.Wishlists.Wish

  @topic inspect(__MODULE__)
  def subscribe do
    Phoenix.PubSub.subscribe(Wishlist.PubSub, @topic)
  end
  def notify_subscribers({:ok, result}, event) do
    Phoenix.PubSub.broadcast(Wishlist.PubSub, @topic, {__MODULE__, event, result})
    {:ok, result}
  end

  def notify_subscribers({:error, reason}, _event), do: {:error, reason}


  @doc """
  Returns the list of wishes.

  ## Examples

      iex> list_wishes()
      [%Wish{}, ...]

  """
  def list_wishes do
    Repo.all(Wish)
  end

  @doc """
  Gets a single wish.

  Raises `Ecto.NoResultsError` if the Wish does not exist.

  ## Examples

      iex> get_wish!(123)
      %Wish{}

      iex> get_wish!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wish!(id), do: Repo.get!(Wish, id)

  @doc """
  Creates a wish.

  ## Examples

      iex> create_wish(%{field: value})
      {:ok, %Wish{}}

      iex> create_wish(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wish(attrs \\ %{}) do
    %Wish{}
    |> Wish.changeset(attrs)
    |> Repo.insert()
    |> notify_subscribers([:wish,:created])
  end

  @doc """
  Updates a wish.

  ## Examples

      iex> update_wish(wish, %{field: new_value})
      {:ok, %Wish{}}

      iex> update_wish(wish, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wish(%Wish{} = wish, attrs) do
    wish
    |> Wish.changeset(attrs)
    |> Repo.update()
    |> notify_subscribers([:wish,:updated])
  end

  @doc """
  Deletes a wish.

  ## Examples

      iex> delete_wish(wish)
      {:ok, %Wish{}}

      iex> delete_wish(wish)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wish(%Wish{} = wish) do
    Repo.delete(wish)
    |> notify_subscribers([:wish,:deleted])
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wish changes.

  ## Examples

      iex> change_wish(wish)
      %Ecto.Changeset{data: %Wish{}}

  """
  def change_wish(%Wish{} = wish, attrs \\ %{}) do
    Wish.changeset(wish, attrs)
  end
end
