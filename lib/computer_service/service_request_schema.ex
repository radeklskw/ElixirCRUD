defmodule ComputerService.ServiceRequestSchema do
  @moduledoc """
  The ServiceRequestSchema context.
  """

  import Ecto.Query, warn: false
  alias ComputerService.Repo

  alias ComputerService.ServiceRequestSchema.ServiceRequest

  @doc """
  Returns the list of servicerequest.

  ## Examples

      iex> list_servicerequest()
      [%ServiceRequest{}, ...]

  """
  def list_servicerequest do
    Repo.all(ServiceRequest)
  end

  @doc """
  Gets a single service_request.

  Raises `Ecto.NoResultsError` if the Service request does not exist.

  ## Examples

      iex> get_service_request!(123)
      %ServiceRequest{}

      iex> get_service_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_service_request(id), do: Repo.get(ServiceRequest, id)

  @doc """
  Creates a service_request.

  ## Examples

      iex> create_service_request(%{field: value})
      {:ok, %ServiceRequest{}}

      iex> create_service_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_service_request(attrs \\ %{}) do
    %ServiceRequest{}
    |> ServiceRequest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a service_request.

  ## Examples

      iex> update_service_request(service_request, %{field: new_value})
      {:ok, %ServiceRequest{}}

      iex> update_service_request(service_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_service_request(%ServiceRequest{} = service_request, attrs) do
    service_request
    |> ServiceRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a service_request.

  ## Examples

      iex> delete_service_request(service_request)
      {:ok, %ServiceRequest{}}

      iex> delete_service_request(service_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_service_request(%ServiceRequest{} = service_request) do
    Repo.delete(service_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking service_request changes.

  ## Examples

      iex> change_service_request(service_request)
      %Ecto.Changeset{data: %ServiceRequest{}}

  """
  def change_service_request(%ServiceRequest{} = service_request, attrs \\ %{}) do
    ServiceRequest.changeset(service_request, attrs)
  end
end
