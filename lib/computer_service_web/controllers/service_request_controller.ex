defmodule ComputerServiceWeb.ServiceRequestController do
  use ComputerServiceWeb, :controller

  alias ComputerService.ServiceRequestSchema
  alias ComputerService.ServiceRequestSchema.ServiceRequest

  action_fallback ComputerServiceWeb.FallbackController

  def index(conn, _params) do
    servicerequest = ServiceRequestSchema.list_servicerequest()
    render(conn, "index.json", servicerequest: servicerequest)
  end

  def create(conn, %{"service_request" => service_request_params}) do
    with {:ok, %ServiceRequest{} = service_request} <- ServiceRequestSchema.create_service_request(service_request_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.service_request_path(conn, :show, service_request))
      |> render("show.json", service_request: service_request)
    end
  end

  def show(conn, %{"id" => id}) do
    service_request = ServiceRequestSchema.get_service_request(id)
    render(conn, "show.json", service_request: service_request)
  end

  def update(conn, %{"id" => id, "service_request" => service_request_params}) do
    service_request = ServiceRequestSchema.get_service_request(id)

    with {:ok, %ServiceRequest{} = service_request} <- ServiceRequestSchema.update_service_request(service_request, service_request_params) do
      render(conn, "show.json", service_request: service_request)
    end
  end

  def delete(conn, %{"id" => id}) do
    service_request = ServiceRequestSchema.get_service_request(id)

    with {:ok, %ServiceRequest{}} <- ServiceRequestSchema.delete_service_request(service_request) do
      send_resp(conn, :no_content, "")
    end
  end
end
