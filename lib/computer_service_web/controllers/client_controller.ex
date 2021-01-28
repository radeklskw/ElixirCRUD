defmodule ComputerServiceWeb.ClientController do
  use ComputerServiceWeb, :controller

  alias ComputerService.Schema
  alias ComputerService.Schema.Client

  action_fallback ComputerServiceWeb.FallbackController

  def index(conn, _params) do
    client = Schema.list_client()
    render(conn, "index.json", client: client)
  end

  def create(conn, %{"client" => client_params}) do
    with {:ok, %Client{} = client} <- Schema.create_client(client_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.client_path(conn, :show, client))
      |> render("show.json", client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    IO.inspect("Get client for id: #{id}")
    case Schema.get_client(id) do
      nil -> {:error, :not_found}
      client -> render(conn, "show.json", client: client)
    end
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Schema.get_client(id)

    with {:ok, %Client{} = client} <- Schema.update_client(client, client_params) do
      render(conn, "show.json", client: client)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Schema.get_client(id)

    with {:ok, %Client{}} <- Schema.delete_client(client) do
      send_resp(conn, :no_content, "")
    end
  end
end
