defmodule ComputerService.ServiceRequestSchema.ServiceRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servicerequest" do
    field :client_id, :integer
    field :created_at, :naive_datetime
    field :device_id, :integer
    field :employee_id, :integer
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(service_request, attrs) do
    service_request
    |> cast(attrs, [:employee_id, :client_id, :device_id, :created_at, :status])
    |> validate_required([:employee_id, :client_id, :device_id, :created_at, :status])
  end
end
