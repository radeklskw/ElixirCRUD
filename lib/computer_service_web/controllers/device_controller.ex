defmodule ComputerServiceWeb.DeviceController do
  use ComputerServiceWeb, :controller

  alias ComputerService.DeviceSchema
  alias ComputerService.DeviceSchema.Device

  action_fallback ComputerServiceWeb.FallbackController

  def index(conn, _params) do
    device = DeviceSchema.list_device()
    render(conn, "index.json", device: device)
  end

  def create(conn, %{"device" => device_params}) do
    with {:ok, %Device{} = device} <- DeviceSchema.create_device(device_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.device_path(conn, :show, device))
      |> render("show.json", device: device)
    end
  end

  def show(conn, %{"id" => id}) do
    device = DeviceSchema.get_device(id)
    render(conn, "show.json", device: device)
  end

  def update(conn, %{"id" => id, "device" => device_params}) do
    device = DeviceSchema.get_device(id)

    with {:ok, %Device{} = device} <- DeviceSchema.update_device(device, device_params) do
      render(conn, "show.json", device: device)
    end
  end

  def delete(conn, %{"id" => id}) do
    device = DeviceSchema.get_device(id)

    with {:ok, %Device{}} <- DeviceSchema.delete_device(device) do
      send_resp(conn, :no_content, "")
    end
  end
end
