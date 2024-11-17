defmodule GfinancasWeb.Router do
  use GfinancasWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {GfinancasWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GfinancasWeb do
    pipe_through :browser
    resources "/receitas", ReceitaController
    resources "/despesas", DespesaController

    get "/", PageController, :home
  end

  # Adicionando a nova rota para a API
  scope "/api", GfinancasWeb do
    pipe_through :api

    get "/receitas_mensais", PageController, :get_receitas_mensais
  end

  scope "/api", GfinancasWeb do
    pipe_through :api

    get "/receitas_mensais", PageController, :get_receitas_mensais
    get "/despesas_mensais", PageController, :get_despesas_mensais # Nova rota para despesas
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:gfinancas, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: GfinancasWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
