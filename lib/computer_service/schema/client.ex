defmodule ComputerService.Schema.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :surname, :email, :phone])
    |> validate_required([:name, :surname, :email, :phone])
  end
end
