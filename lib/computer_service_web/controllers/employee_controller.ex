defmodule ComputerServiceWeb.EmployeeController do
  use ComputerServiceWeb, :controller

  alias ComputerService.EmployeeSchema
  alias ComputerService.EmployeeSchema.Employee

  action_fallback ComputerServiceWeb.FallbackController

  def index(conn, _params) do
    employee = EmployeeSchema.list_employee()
    render(conn, "index.json", employee: employee)
  end

  def create(conn, %{"employee" => employee_params}) do
    with {:ok, %Employee{} = employee} <- EmployeeSchema.create_employee(employee_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.employee_path(conn, :show, employee))
      |> render("show.json", employee: employee)
    end
  end

  def show(conn, %{"id" => id}) do
    IO.inspect("Get employee for id: #{id}")
    case EmployeeSchema.get_employee(id) do
      nil -> {:error, :not_found}
      employee -> render(conn, "show.json", employee: employee)
    end
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = EmployeeSchema.get_employee(id)

    with {:ok, %Employee{} = employee} <- EmployeeSchema.update_employee(employee, employee_params) do
      render(conn, "show.json", employee: employee)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = EmployeeSchema.get_employee(id)

    with {:ok, %Employee{}} <- EmployeeSchema.delete_employee(employee) do
      send_resp(conn, :no_content, "")
    end
  end
end
