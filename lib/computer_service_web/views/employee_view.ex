defmodule ComputerServiceWeb.EmployeeView do
  use ComputerServiceWeb, :view
  alias ComputerServiceWeb.EmployeeView

  def render("index.json", %{employee: employee}) do
    %{data: render_many(employee, EmployeeView, "employee.json")}
  end

  def render("show.json", %{employee: employee}) do
    %{data: render_one(employee, EmployeeView, "employee.json")}
  end

  def render("employee.json", %{employee: employee}) do
    %{id: employee.id,
      name: employee.name,
      surname: employee.surname,
      dateofemployment: employee.dateofemployment,
      team: employee.team}
  end
end
