defmodule KefisWeb.ProductsLive.Index do
  use KefisWeb, :live_view

  alias Kefis.Catalog

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket = assign(socket, products: Catalog.list_products)
    {:ok, socket, temporary_assigns: [products: []]}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")# edit product
    |> assign(:product, Catalog.get_product!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, Catalog.new_product())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Product")
    |> assign(:product, nil)
  end

end
