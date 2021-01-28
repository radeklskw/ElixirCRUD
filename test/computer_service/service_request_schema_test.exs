defmodule ComputerService.ServiceRequestSchemaTest do
  use ComputerService.DataCase

  alias ComputerService.ServiceRequestSchema

  describe "servicerequest" do
    alias ComputerService.ServiceRequestSchema.ServiceRequest

    @valid_attrs %{client_id: 42, created_at: ~N[2010-04-17 14:00:00], device_id: 42, employee_id: 42, status: "some status"}
    @update_attrs %{client_id: 43, created_at: ~N[2011-05-18 15:01:01], device_id: 43, employee_id: 43, status: "some updated status"}
    @invalid_attrs %{client_id: nil, created_at: nil, device_id: nil, employee_id: nil, status: nil}

    def service_request_fixture(attrs \\ %{}) do
      {:ok, service_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ServiceRequestSchema.create_service_request()

      service_request
    end

    test "list_servicerequest/0 returns all servicerequest" do
      service_request = service_request_fixture()
      assert ServiceRequestSchema.list_servicerequest() == [service_request]
    end

    test "get_service_request!/1 returns the service_request with given id" do
      service_request = service_request_fixture()
      assert ServiceRequestSchema.get_service_request!(service_request.id) == service_request
    end

    test "create_service_request/1 with valid data creates a service_request" do
      assert {:ok, %ServiceRequest{} = service_request} = ServiceRequestSchema.create_service_request(@valid_attrs)
      assert service_request.client_id == 42
      assert service_request.created_at == ~N[2010-04-17 14:00:00]
      assert service_request.device_id == 42
      assert service_request.employee_id == 42
      assert service_request.status == "some status"
    end

    test "create_service_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ServiceRequestSchema.create_service_request(@invalid_attrs)
    end

    test "update_service_request/2 with valid data updates the service_request" do
      service_request = service_request_fixture()
      assert {:ok, %ServiceRequest{} = service_request} = ServiceRequestSchema.update_service_request(service_request, @update_attrs)
      assert service_request.client_id == 43
      assert service_request.created_at == ~N[2011-05-18 15:01:01]
      assert service_request.device_id == 43
      assert service_request.employee_id == 43
      assert service_request.status == "some updated status"
    end

    test "update_service_request/2 with invalid data returns error changeset" do
      service_request = service_request_fixture()
      assert {:error, %Ecto.Changeset{}} = ServiceRequestSchema.update_service_request(service_request, @invalid_attrs)
      assert service_request == ServiceRequestSchema.get_service_request!(service_request.id)
    end

    test "delete_service_request/1 deletes the service_request" do
      service_request = service_request_fixture()
      assert {:ok, %ServiceRequest{}} = ServiceRequestSchema.delete_service_request(service_request)
      assert_raise Ecto.NoResultsError, fn -> ServiceRequestSchema.get_service_request!(service_request.id) end
    end

    test "change_service_request/1 returns a service_request changeset" do
      service_request = service_request_fixture()
      assert %Ecto.Changeset{} = ServiceRequestSchema.change_service_request(service_request)
    end
  end
end
