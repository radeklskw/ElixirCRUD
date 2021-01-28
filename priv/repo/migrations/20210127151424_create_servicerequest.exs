defmodule ComputerService.Repo.Migrations.CreateServicerequest do
  use Ecto.Migration

  def change do
    create table(:servicerequest) do
      add :employee_id, :integer
      add :client_id, :integer
      add :device_id, :integer
      add :created_at, :naive_datetime
      add :status, :string

      timestamps()
    end

  end
end
