defmodule ComputerService.Repo.Migrations.CreateEmployee do
  use Ecto.Migration

  def change do
    create table(:employee) do
      add :name, :string
      add :surname, :string
      add :dateofemployment, :date
      add :team, :string

      timestamps()
    end

  end
end
