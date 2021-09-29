defmodule KefisWeb.Router do
  use KefisWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {KefisWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KefisWeb do
    pipe_through :browser

    live "/", DashboardLive, :home

    live "/products", ProductsLive.Index, :index
    live "/products/new", ProductsLive.Index, :new
    live "/products/:id/edit-inline", ProductsLive.Index, :edit

    live "/products/:id", ProductsLive.Show, :show
    live "/products/:id/edit", ProductsLive.Show, :edit

    live "/inventory", InventoryLive.Index, :index
    live "/suppliers", SuppliersLive.Index, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LagerWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/system-stats", metrics: KefisWeb.Telemetry
    end
  end
end
