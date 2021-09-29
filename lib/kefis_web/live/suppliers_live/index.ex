defmodule KefisWeb.SuppliersLive.Index do
  use KefisWeb, :live_view

  alias Kefis.SupplyManagement

  def mount(_params, _session, socket) do
    socket = assign(socket, suppliers: SupplyManagement.list_suppliers())
    {:ok, socket, temporary_assigns: [suppliers: []]}
  end
end
