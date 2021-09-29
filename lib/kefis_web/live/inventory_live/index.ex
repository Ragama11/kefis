defmodule KefisWeb.InventoryLive.Index do
  use KefisWeb, :live_view

  alias Kefis.Inventory

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket = assign(socket, inventory_items: Inventory.list_inventory_items)
    {:ok, socket, temporary_assigns: [inventory_items: []]}
  end
end
