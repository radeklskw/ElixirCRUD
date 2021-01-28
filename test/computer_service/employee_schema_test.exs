defmodule ComputerService.EmployeeSchemaTest do
  use ComputerService.DataCase

  alias ComputerService.EmployeeSchema

  describe "employee" do
    alias ComputerService.EmployeeSchema.Employee

    @valid_attrs %{dateofemployment: ~D[2010-04-17], name: "some name", surname: "some surname", team: "some team"}
    @update_attrs %{dateofemployment: ~D[2011-05-18], name: "some updated name", surname: "some updated surname", team: "some updated team"}
    @invalid_attrs %{dateofemployment: nil, name: nil, surname: nil, team: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EmployeeSchema.create_employee()

      employee
    end

    test "list_employee/0 returns all employee" do
      employee = employee_fixture()
      assert EmployeeSchema.list_employee() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert EmployeeSchema.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = EmployeeSchema.create_employee(@valid_attrs)
      assert employee.dateofemployment == ~D[2010-04-17]
      assert employee.name == "some name"
      assert employee.surname == "some surname"
      assert employee.team == "some team"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EmployeeSchema.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = EmployeeSchema.update_employee(employee, @update_attrs)
      assert employee.dateofemployment == ~D[2011-05-18]
      assert employee.name == "some updated name"
      assert employee.surname == "some updated surname"
      assert employee.team == "some updated team"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = EmployeeSchema.update_employee(employee, @invalid_attrs)
      assert employee == EmployeeSchema.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = EmployeeSchema.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> EmployeeSchema.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = EmployeeSchema.change_employee(employee)
    end
  end
end
