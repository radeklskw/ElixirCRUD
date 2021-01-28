defmodule ComputerService.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:client) do
      add :name, :string
      add :surname, :string
      add :email, :string
      add :phone, :string

      timestamps()
    end

  end
end
