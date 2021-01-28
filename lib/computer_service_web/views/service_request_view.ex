defmodule ComputerServiceWeb.ServiceRequestView do
  use ComputerServiceWeb, :view
  alias ComputerServiceWeb.ServiceRequestView

  def render("index.json", %{servicerequest: servicerequest}) do
    %{data: render_many(servicerequest, ServiceRequestView, "service_request.json")}
  end

  def render("show.json", %{service_request: service_request}) do
    %{data: render_one(service_request, ServiceRequestView, "service_request.json")}
  end

  def render("service_request.json", %{service_request: service_request}) do
    %{id: service_request.id,
      employee_id: service_request.employee_id,
      client_id: service_request.client_id,
      device_id: service_request.device_id,
      created_at: service_request.created_at,
      status: service_request.status}
  end
end
