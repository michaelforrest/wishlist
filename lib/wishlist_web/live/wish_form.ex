defmodule WishlistWeb.WishForm do
  use WishlistWeb, :live_component
  alias Wishlist.Wishlists

  def mount(socket) do
    {:ok, socket}
  end

  def update(%{wish: wish}, socket) do
    {
      :ok, socket
      |> assign(:wish, wish)
      |> assign(:changeset, Wishlists.change_wish(wish))
    }
  end

  def handle_event("save", %{"wish" => wish_attrs}, socket) do
    {:ok, _wish} = Wishlists.update_wish(socket.assigns.wish, wish_attrs)

    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <%= f = form_for(@changeset, "#", phx_target: @myself, phx_change: "save") %>
      <%= text_input(f, :name, placeholder: "Name") %>
      <%= text_input(f, :image_url, placeholder: "Image URL") %>
    </form>
    """
  end
end
