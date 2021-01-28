defmodule ComputerService.DeviceSchemaTest do
  use ComputerService.DataCase

  alias ComputerService.DeviceSchema

  describe "device" do
    alias ComputerService.DeviceSchema.Device

    @valid_attrs %{brand: "some brand", category: "some category", model: "some model"}
    @update_attrs %{brand: "some updated brand", category: "some updated category", model: "some updated model"}
    @invalid_attrs %{brand: nil, category: nil, model: nil}

    def device_fixture(attrs \\ %{}) do
      {:ok, device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DeviceSchema.create_device()

      device
    end

    test "list_device/0 returns all device" do
      device = device_fixture()
      assert DeviceSchema.list_device() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert DeviceSchema.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      assert {:ok, %Device{} = device} = DeviceSchema.create_device(@valid_attrs)
      assert device.brand == "some brand"
      assert device.category == "some category"
      assert device.model == "some model"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DeviceSchema.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      assert {:ok, %Device{} = device} = DeviceSchema.update_device(device, @update_attrs)
      assert device.brand == "some updated brand"
      assert device.category == "some updated category"
      assert device.model == "some updated model"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = DeviceSchema.update_device(device, @invalid_attrs)
      assert device == DeviceSchema.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = DeviceSchema.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> DeviceSchema.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = DeviceSchema.change_device(device)
    end
  end
end
