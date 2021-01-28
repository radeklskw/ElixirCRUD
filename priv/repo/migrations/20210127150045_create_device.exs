defmodule ComputerService.Repo.Migrations.CreateDevice do
  use Ecto.Migration

  def change do
    create table(:device) do
      add :brand, :string
      add :model, :string
      add :category, :string

      timestamps()
    end

  end
end
