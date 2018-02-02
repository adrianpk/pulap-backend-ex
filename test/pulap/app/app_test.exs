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

  describe "properties" do
    alias Pulap.App.Property

    @valid_attrs %{boolean: true, date: ~D[2010-04-17], datetime: ~N[2010-04-17 14:00:00.000000], decimal: "120.5", description: "some description", float: 120.5, geolocation: 120.5, id: "7488a646-e31f-11e4-aace-600308960662", integer: 42, is_active: true, is_logical_deleted: true, name: "some name", property_data_type: "some property_data_type", property_set_name: "some property_set_name", string: "some string", time: ~T[14:00:00.000000], uuid: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{boolean: false, date: ~D[2011-05-18], datetime: ~N[2011-05-18 15:01:01.000000], decimal: "456.7", description: "some updated description", float: 456.7, geolocation: 456.7, id: "7488a646-e31f-11e4-aace-600308960668", integer: 43, is_active: false, is_logical_deleted: false, name: "some updated name", property_data_type: "some updated property_data_type", property_set_name: "some updated property_set_name", string: "some updated string", time: ~T[15:01:01.000000], uuid: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{boolean: nil, date: nil, datetime: nil, decimal: nil, description: nil, float: nil, geolocation: nil, id: nil, integer: nil, is_active: nil, is_logical_deleted: nil, name: nil, property_data_type: nil, property_set_name: nil, string: nil, time: nil, uuid: nil}

    def property_fixture(attrs \\ %{}) do
      {:ok, property} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_property()

      property
    end

    test "list_properties/0 returns all properties" do
      property = property_fixture()
      assert App.list_properties() == [property]
    end

    test "get_property!/1 returns the property with given id" do
      property = property_fixture()
      assert App.get_property!(property.id) == property
    end

    test "create_property/1 with valid data creates a property" do
      assert {:ok, %Property{} = property} = App.create_property(@valid_attrs)
      assert property.boolean == true
      assert property.date == ~D[2010-04-17]
      assert property.datetime == ~N[2010-04-17 14:00:00.000000]
      assert property.decimal == Decimal.new("120.5")
      assert property.description == "some description"
      assert property.float == 120.5
      assert property.geolocation == 120.5
      assert property.id == "7488a646-e31f-11e4-aace-600308960662"
      assert property.integer == 42
      assert property.is_active == true
      assert property.is_logical_deleted == true
      assert property.name == "some name"
      assert property.property_data_type == "some property_data_type"
      assert property.property_set_name == "some property_set_name"
      assert property.string == "some string"
      assert property.time == ~T[14:00:00.000000]
      assert property.uuid == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_property/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_property(@invalid_attrs)
    end

    test "update_property/2 with valid data updates the property" do
      property = property_fixture()
      assert {:ok, property} = App.update_property(property, @update_attrs)
      assert %Property{} = property
      assert property.boolean == false
      assert property.date == ~D[2011-05-18]
      assert property.datetime == ~N[2011-05-18 15:01:01.000000]
      assert property.decimal == Decimal.new("456.7")
      assert property.description == "some updated description"
      assert property.float == 456.7
      assert property.geolocation == 456.7
      assert property.id == "7488a646-e31f-11e4-aace-600308960668"
      assert property.integer == 43
      assert property.is_active == false
      assert property.is_logical_deleted == false
      assert property.name == "some updated name"
      assert property.property_data_type == "some updated property_data_type"
      assert property.property_set_name == "some updated property_set_name"
      assert property.string == "some updated string"
      assert property.time == ~T[15:01:01.000000]
      assert property.uuid == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_property/2 with invalid data returns error changeset" do
      property = property_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_property(property, @invalid_attrs)
      assert property == App.get_property!(property.id)
    end

    test "delete_property/1 deletes the property" do
      property = property_fixture()
      assert {:ok, %Property{}} = App.delete_property(property)
      assert_raise Ecto.NoResultsError, fn -> App.get_property!(property.id) end
    end

    test "change_property/1 returns a property changeset" do
      property = property_fixture()
      assert %Ecto.Changeset{} = App.change_property(property)
    end
  end
end
