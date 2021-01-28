defmodule ComputerServiceWeb.Router do
  use ComputerServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ComputerServiceWeb do
    pipe_through :api
    get "/clients", ClientController, :index
    get "/clients/:id", ClientController, :show
    post "/clients/add", ClientController, :create
    post "/clients/update", ClientController, :update
    delete "/clients/:id", ClientController, :delete

    get "/employee", EmployeeController, :index
    get "/employee/:id", EmployeeController, :show
    post "/employee/add", EmployeeController, :create
    post "/employee/update", EmployeeController, :update
    delete "/employee/:id", EmployeeController, :delete

    get "/device", DeviceController, :index
    get "/device/:id", DeviceController, :show
    post "/device/add", DeviceController, :create
    post "/device/update", DeviceController, :update
    delete "/device/:id", DeviceController, :delete

    get "/service-request", ServiceRequestController, :index
    get "/service-request/:id", ServiceRequestController, :show
    post "/service-request/add", ServiceRequestController, :create
    post "/service-request/update", ServiceRequestController, :update
    delete "/service-request/:id", ServiceRequestController, :delete

  end

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
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ComputerServiceWeb.Telemetry
    end
  end
end
