defmodule ComputerService.DeviceSchema.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "device" do
    field :brand, :string
    field :category, :string
    field :model, :string

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:brand, :model, :category])
    |> validate_required([:brand, :model, :category])
  end
end
