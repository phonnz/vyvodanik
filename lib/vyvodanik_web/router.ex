defmodule VyvodanikWeb.Router do
  use VyvodanikWeb, :router

  alias VyvodanikWeb.EntryLive

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {VyvodanikWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VyvodanikWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", VyvodanikWeb do
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

      live "/entries", EntryLive.Index, :index
      live "/entries/new", EntryLive.Index, :new
      live "/entries/:id/edit", EntryLive.Index, :edit

      live "/entries/:id", EntryLive.Show, :show
      live "/entries/:id/show/edit", EntryLive.Show, :edit

      live_dashboard "/dashboard", metrics: VyvodanikWeb.Telemetry
    end
  end
end
