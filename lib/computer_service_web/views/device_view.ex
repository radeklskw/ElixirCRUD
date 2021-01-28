defmodule ComputerServiceWeb.DeviceView do
  use ComputerServiceWeb, :view
  alias ComputerServiceWeb.DeviceView

  def render("index.json", %{device: device}) do
    %{data: render_many(device, DeviceView, "device.json")}
  end

  def render("show.json", %{device: device}) do
    %{data: render_one(device, DeviceView, "device.json")}
  end

  def render("device.json", %{device: device}) do
    %{id: device.id,
      brand: device.brand,
      model: device.model,
      category: device.category}
  end
end
