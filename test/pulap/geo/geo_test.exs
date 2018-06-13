defmodule Pulap.GeoTest do
  use Pulap.DataCase

  alias Pulap.Geo

  describe "geo_areas" do
    alias Pulap.Geo.GeoArea

    @valid_attrs %{
      adm_level: "some adm_level",
      adm_level_type: "some adm_level_type",
      alternative_name: "some alternative_name",
      alternative_name_loc: "some alternative_name_loc",
      canonical_name: "some canonical_name",
      canonical_name_loc: "some canonical_name_loc",
      dialing_code: "some dialing_code",
      geo_areas: 42,
      id: "7488a646-e31f-11e4-aace-600308960662",
      is_active: true,
      is_logical_deleted: true,
      is_main: true,
      locale: "some locale",
      name: "some name",
      name_loc: "some name_loc",
      normalized_name: "some normalized_name",
      position: 42,
      zip_code: "some zip_code"
    }
    @update_attrs %{
      adm_level: "some updated adm_level",
      adm_level_type: "some updated adm_level_type",
      alternative_name: "some updated alternative_name",
      alternative_name_loc: "some updated alternative_name_loc",
      canonical_name: "some updated canonical_name",
      canonical_name_loc: "some updated canonical_name_loc",
      dialing_code: "some updated dialing_code",
      geo_areas: 43,
      id: "7488a646-e31f-11e4-aace-600308960668",
      is_active: false,
      is_logical_deleted: false,
      is_main: false,
      locale: "some updated locale",
      name: "some updated name",
      name_loc: "some updated name_loc",
      normalized_name: "some updated normalized_name",
      position: 43,
      zip_code: "some updated zip_code"
    }
    @invalid_attrs %{
      adm_level: nil,
      adm_level_type: nil,
      alternative_name: nil,
      alternative_name_loc: nil,
      canonical_name: nil,
      canonical_name_loc: nil,
      dialing_code: nil,
      geo_areas: nil,
      id: nil,
      is_active: nil,
      is_logical_deleted: nil,
      is_main: nil,
      locale: nil,
      name: nil,
      name_loc: nil,
      normalized_name: nil,
      position: nil,
      zip_code: nil
    }

    def geo_area_fixture(attrs \\ %{}) do
      {:ok, geo_area} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_geo_area()

      geo_area
    end

    test "list_geo_areas/0 returns all geo_areas" do
      geo_area = geo_area_fixture()
      assert Geo.list_geo_areas() == [geo_area]
    end

    test "get_geo_area!/1 returns the geo_area with given id" do
      geo_area = geo_area_fixture()
      assert Geo.get_geo_area!(geo_area.id) == geo_area
    end

    test "create_geo_area/1 with valid data creates a geo_area" do
      assert {:ok, %GeoArea{} = geo_area} = Geo.create_geo_area(@valid_attrs)
      assert geo_area.adm_level == "some adm_level"
      assert geo_area.adm_level_type == "some adm_level_type"
      assert geo_area.alternative_name == "some alternative_name"
      assert geo_area.alternative_name_loc == "some alternative_name_loc"
      assert geo_area.canonical_name == "some canonical_name"
      assert geo_area.canonical_name_loc == "some canonical_name_loc"
      assert geo_area.dialing_code == "some dialing_code"
      assert geo_area.geo_areas == 42
      assert geo_area.id == "7488a646-e31f-11e4-aace-600308960662"
      assert geo_area.is_active == true
      assert geo_area.is_logical_deleted == true
      assert geo_area.is_main == true
      assert geo_area.locale == "some locale"
      assert geo_area.name == "some name"
      assert geo_area.name_loc == "some name_loc"
      assert geo_area.normalized_name == "some normalized_name"
      assert geo_area.position == 42
      assert geo_area.zip_code == "some zip_code"
    end

    test "create_geo_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_geo_area(@invalid_attrs)
    end

    test "update_geo_area/2 with valid data updates the geo_area" do
      geo_area = geo_area_fixture()
      assert {:ok, geo_area} = Geo.update_geo_area(geo_area, @update_attrs)
      assert %GeoArea{} = geo_area
      assert geo_area.adm_level == "some updated adm_level"
      assert geo_area.adm_level_type == "some updated adm_level_type"
      assert geo_area.alternative_name == "some updated alternative_name"
      assert geo_area.alternative_name_loc == "some updated alternative_name_loc"
      assert geo_area.canonical_name == "some updated canonical_name"
      assert geo_area.canonical_name_loc == "some updated canonical_name_loc"
      assert geo_area.dialing_code == "some updated dialing_code"
      assert geo_area.geo_areas == 43
      assert geo_area.id == "7488a646-e31f-11e4-aace-600308960668"
      assert geo_area.is_active == false
      assert geo_area.is_logical_deleted == false
      assert geo_area.is_main == false
      assert geo_area.locale == "some updated locale"
      assert geo_area.name == "some updated name"
      assert geo_area.name_loc == "some updated name_loc"
      assert geo_area.normalized_name == "some updated normalized_name"
      assert geo_area.position == 43
      assert geo_area.zip_code == "some updated zip_code"
    end

    test "update_geo_area/2 with invalid data returns error changeset" do
      geo_area = geo_area_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_geo_area(geo_area, @invalid_attrs)
      assert geo_area == Geo.get_geo_area!(geo_area.id)
    end

    test "delete_geo_area/1 deletes the geo_area" do
      geo_area = geo_area_fixture()
      assert {:ok, %GeoArea{}} = Geo.delete_geo_area(geo_area)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_geo_area!(geo_area.id) end
    end

    test "change_geo_area/1 returns a geo_area changeset" do
      geo_area = geo_area_fixture()
      assert %Ecto.Changeset{} = Geo.change_geo_area(geo_area)
    end
  end
end
