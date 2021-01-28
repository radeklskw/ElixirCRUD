defmodule ComputerService.EmployeeSchema.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employee" do
    field :dateofemployment, :date
    field :name, :string
    field :surname, :string
    field :team, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :surname, :dateofemployment, :team])
    |> validate_required([:name, :surname, :dateofemployment, :team])
  end
end
