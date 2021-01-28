defmodule ComputerServiceWeb.EmployeeControllerTest do
  use ComputerServiceWeb.ConnCase

  alias ComputerService.EmployeeSchema
  alias ComputerService.EmployeeSchema.Employee

  @create_attrs %{
    dateofemployment: ~D[2010-04-17],
    name: "some name",
    surname: "some surname",
    team: "some team"
  }
  @update_attrs %{
    dateofemployment: ~D[2011-05-18],
    name: "some updated name",
    surname: "some updated surname",
    team: "some updated team"
  }
  @invalid_attrs %{dateofemployment: nil, name: nil, surname: nil, team: nil}

  def fixture(:employee) do
    {:ok, employee} = EmployeeSchema.create_employee(@create_attrs)
    employee
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all employee", %{conn: conn} do
      conn = get(conn, Routes.employee_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create employee" do
    test "renders employee when data is valid", %{conn: conn} do
      conn = post(conn, Routes.employee_path(conn, :create), employee: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.employee_path(conn, :show, id))

      assert %{
               "id" => id,
               "dateofemployment" => "2010-04-17",
               "name" => "some name",
               "surname" => "some surname",
               "team" => "some team"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.employee_path(conn, :create), employee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update employee" do
    setup [:create_employee]

    test "renders employee when data is valid", %{conn: conn, employee: %Employee{id: id} = employee} do
      conn = put(conn, Routes.employee_path(conn, :update, employee), employee: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.employee_path(conn, :show, id))

      assert %{
               "id" => id,
               "dateofemployment" => "2011-05-18",
               "name" => "some updated name",
               "surname" => "some updated surname",
               "team" => "some updated team"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, employee: employee} do
      conn = put(conn, Routes.employee_path(conn, :update, employee), employee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete employee" do
    setup [:create_employee]

    test "deletes chosen employee", %{conn: conn, employee: employee} do
      conn = delete(conn, Routes.employee_path(conn, :delete, employee))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.employee_path(conn, :show, employee))
      end
    end
  end

  defp create_employee(_) do
    employee = fixture(:employee)
    %{employee: employee}
  end
end
