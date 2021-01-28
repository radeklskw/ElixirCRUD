defmodule ComputerServiceWeb.ClientView do
  use ComputerServiceWeb, :view
  alias ComputerServiceWeb.ClientView

  def render("index.json", %{client: client}) do
    %{data: render_many(client, ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{id: client.id,
      name: client.name,
      surname: client.surname,
      email: client.email,
      phone: client.phone}
  end
end
