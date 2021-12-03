defmodule WishlistWeb.ShowLive do
  use WishlistWeb, :live_view
  alias Wishlist.Wishlists

  def mount(_params, _session, socket) do
    if connected?(socket), do: Wishlists.subscribe()
    {
      :ok, socket
      |> reload()
    }
  end

  def handle_info({Wishlists, _, _}, socket) do
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
    <p>This is my wishlist, buy me things from it!</p>
    <%= for wish <- @wishes do %>
      <li><%= wish.name %> <%= img_tag( wish.image_url, width: 100) %></li>
    <% end %>
    """
  end
end
