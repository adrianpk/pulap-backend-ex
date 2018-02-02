defmodule Pulap.AppTest do
  use Pulap.DataCase

  alias Pulap.App

  describe "properties_sets" do
    alias Pulap.App.PropertiesSet

    @valid_attrs %{description: "some description", holder_id: "7488a646-e31f-11e4-aace-600308960662", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: "some is_logical_deleted", name: "some name"}
    @update_attrs %{description: "some updated description", holder_id: "7488a646-e31f-11e4-aace-600308960668", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: "some updated is_logical_deleted", name: "some updated name"}
    @invalid_attrs %{description: nil, holder_id: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil}

    def properties_set_fixture(attrs \\ %{}) do
      {:ok, properties_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_properties_set()

      properties_set
    end

    test "list_properties_sets/0 returns all properties_sets" do
      properties_set = properties_set_fixture()
      assert App.list_properties_sets() == [properties_set]
    end

    test "get_properties_set!/1 returns the properties_set with given id" do
      properties_set = properties_set_fixture()
      assert App.get_properties_set!(properties_set.id) == properties_set
    end

    test "create_properties_set/1 with valid data creates a properties_set" do
      assert {:ok, %PropertiesSet{} = properties_set} = App.create_properties_set(@valid_attrs)
      assert properties_set.description == "some description"
      assert properties_set.holder_id == "7488a646-e31f-11e4-aace-600308960662"
      assert properties_set.id == "7488a646-e31f-11e4-aace-600308960662"
      assert properties_set.is_active == true
      assert properties_set.is_logical_deleted == "some is_logical_deleted"
      assert properties_set.name == "some name"
    end

    test "create_properties_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_properties_set(@invalid_attrs)
    end

    test "update_properties_set/2 with valid data updates the properties_set" do
      properties_set = properties_set_fixture()
      assert {:ok, properties_set} = App.update_properties_set(properties_set, @update_attrs)
      assert %PropertiesSet{} = properties_set
      assert properties_set.description == "some updated description"
      assert properties_set.holder_id == "7488a646-e31f-11e4-aace-600308960668"
      assert properties_set.id == "7488a646-e31f-11e4-aace-600308960668"
      assert properties_set.is_active == false
      assert properties_set.is_logical_deleted == "some updated is_logical_deleted"
      assert properties_set.name == "some updated name"
    end

    test "update_properties_set/2 with invalid data returns error changeset" do
      properties_set = properties_set_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_properties_set(properties_set, @invalid_attrs)
      assert properties_set == App.get_properties_set!(properties_set.id)
    end

    test "delete_properties_set/1 deletes the properties_set" do
      properties_set = properties_set_fixture()
      assert {:ok, %PropertiesSet{}} = App.delete_properties_set(properties_set)
      assert_raise Ecto.NoResultsError, fn -> App.get_properties_set!(properties_set.id) end
    end

    test "change_properties_set/1 returns a properties_set changeset" do
      properties_set = properties_set_fixture()
      assert %Ecto.Changeset{} = App.change_properties_set(properties_set)
    end
  end

  describe "property_sets" do
    alias Pulap.App.PropertySet

    @valid_attrs %{description: "some description", holder_id: "7488a646-e31f-11e4-aace-600308960662", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: "some is_logical_deleted", name: "some name"}
    @update_attrs %{description: "some updated description", holder_id: "7488a646-e31f-11e4-aace-600308960668", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: "some updated is_logical_deleted", name: "some updated name"}
    @invalid_attrs %{description: nil, holder_id: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil}

    def property_set_fixture(attrs \\ %{}) do
      {:ok, property_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_property_set()

      property_set
    end

    test "list_property_sets/0 returns all property_sets" do
      property_set = property_set_fixture()
      assert App.list_property_sets() == [property_set]
    end

    test "get_property_set!/1 returns the property_set with given id" do
      property_set = property_set_fixture()
      assert App.get_property_set!(property_set.id) == property_set
    end

    test "create_property_set/1 with valid data creates a property_set" do
      assert {:ok, %PropertySet{} = property_set} = App.create_property_set(@valid_attrs)
      assert property_set.description == "some description"
      assert property_set.holder_id == "7488a646-e31f-11e4-aace-600308960662"
      assert property_set.id == "7488a646-e31f-11e4-aace-600308960662"
      assert property_set.is_active == true
      assert property_set.is_logical_deleted == "some is_logical_deleted"
      assert property_set.name == "some name"
    end

    test "create_property_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_property_set(@invalid_attrs)
    end

    test "update_property_set/2 with valid data updates the property_set" do
      property_set = property_set_fixture()
      assert {:ok, property_set} = App.update_property_set(property_set, @update_attrs)
      assert %PropertySet{} = property_set
      assert property_set.description == "some updated description"
      assert property_set.holder_id == "7488a646-e31f-11e4-aace-600308960668"
      assert property_set.id == "7488a646-e31f-11e4-aace-600308960668"
      assert property_set.is_active == false
      assert property_set.is_logical_deleted == "some updated is_logical_deleted"
      assert property_set.name == "some updated name"
    end

    test "update_property_set/2 with invalid data returns error changeset" do
      property_set = property_set_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_property_set(property_set, @invalid_attrs)
      assert property_set == App.get_property_set!(property_set.id)
    end

    test "delete_property_set/1 deletes the property_set" do
      property_set = property_set_fixture()
      assert {:ok, %PropertySet{}} = App.delete_property_set(property_set)
      assert_raise Ecto.NoResultsError, fn -> App.get_property_set!(property_set.id) end
    end

    test "change_property_set/1 returns a property_set changeset" do
      property_set = property_set_fixture()
      assert %Ecto.Changeset{} = App.change_property_set(property_set)
    end
  end
end
