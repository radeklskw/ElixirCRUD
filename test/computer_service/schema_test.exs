defmodule ComputerService.SchemaTest do
  use ComputerService.DataCase

  alias ComputerService.Schema

  describe "client" do
    alias ComputerService.Schema.Client

    @valid_attrs %{email: "some email", name: "some name", phone: "some phone", surname: "some surname"}
    @update_attrs %{email: "some updated email", name: "some updated name", phone: "some updated phone", surname: "some updated surname"}
    @invalid_attrs %{email: nil, name: nil, phone: nil, surname: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schema.create_client()

      client
    end

    test "list_client/0 returns all client" do
      client = client_fixture()
      assert Schema.list_client() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Schema.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Schema.create_client(@valid_attrs)
      assert client.email == "some email"
      assert client.name == "some name"
      assert client.phone == "some phone"
      assert client.surname == "some surname"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Schema.update_client(client, @update_attrs)
      assert client.email == "some updated email"
      assert client.name == "some updated name"
      assert client.phone == "some updated phone"
      assert client.surname == "some updated surname"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_client(client, @invalid_attrs)
      assert client == Schema.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Schema.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Schema.change_client(client)
    end
  end
end
