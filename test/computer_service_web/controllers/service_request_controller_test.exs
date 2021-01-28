defmodule ComputerServiceWeb.ServiceRequestControllerTest do
  use ComputerServiceWeb.ConnCase

  alias ComputerService.ServiceRequestSchema
  alias ComputerService.ServiceRequestSchema.ServiceRequest

  @create_attrs %{
    client_id: 42,
    created_at: ~N[2010-04-17 14:00:00],
    device_id: 42,
    employee_id: 42,
    status: "some status"
  }
  @update_attrs %{
    client_id: 43,
    created_at: ~N[2011-05-18 15:01:01],
    device_id: 43,
    employee_id: 43,
    status: "some updated status"
  }
  @invalid_attrs %{client_id: nil, created_at: nil, device_id: nil, employee_id: nil, status: nil}

  def fixture(:service_request) do
    {:ok, service_request} = ServiceRequestSchema.create_service_request(@create_attrs)
    service_request
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all servicerequest", %{conn: conn} do
      conn = get(conn, Routes.service_request_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create service_request" do
    test "renders service_request when data is valid", %{conn: conn} do
      conn = post(conn, Routes.service_request_path(conn, :create), service_request: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.service_request_path(conn, :show, id))

      assert %{
               "id" => id,
               "client_id" => 42,
               "created_at" => "2010-04-17T14:00:00",
               "device_id" => 42,
               "employee_id" => 42,
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.service_request_path(conn, :create), service_request: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update service_request" do
    setup [:create_service_request]

    test "renders service_request when data is valid", %{conn: conn, service_request: %ServiceRequest{id: id} = service_request} do
      conn = put(conn, Routes.service_request_path(conn, :update, service_request), service_request: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.service_request_path(conn, :show, id))

      assert %{
               "id" => id,
               "client_id" => 43,
               "created_at" => "2011-05-18T15:01:01",
               "device_id" => 43,
               "employee_id" => 43,
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, service_request: service_request} do
      conn = put(conn, Routes.service_request_path(conn, :update, service_request), service_request: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete service_request" do
    setup [:create_service_request]

    test "deletes chosen service_request", %{conn: conn, service_request: service_request} do
      conn = delete(conn, Routes.service_request_path(conn, :delete, service_request))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.service_request_path(conn, :show, service_request))
      end
    end
  end

  defp create_service_request(_) do
    service_request = fixture(:service_request)
    %{service_request: service_request}
  end
end
