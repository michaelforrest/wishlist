defmodule WishlistWeb.EditLive do
  use WishlistWeb, :live_view
  alias Wishlist.Wishlists

  def mount(_params, _session, socket) do
    {
      :ok, socket
      |> reload()
    }
  end

  def handle_event("add-wish", _, socket) do
    {:ok, _} = Wishlists.create_wish(%{name: "New Wish"})
    {
      :noreply, socket
      |> reload()
    }
  end

  defp reload(socket) do
    socket
    |> assign(:wishes, Wishlists.list_wishes)
  end

  def render(assigns) do
    ~L"""
    <p>This is my admin page for adding things to my wishlist.</p>
    <%= link "Add Wish", to: "#", phx_click: "add-wish" %>
    <%= for wish <- @wishes do %>
      <%= live_component @socket, WishlistWeb.WishForm, wish: wish, id: wish.id %>
    <% end %>

    """
  end
end
