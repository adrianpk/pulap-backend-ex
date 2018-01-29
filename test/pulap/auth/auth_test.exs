defmodule Pulap.AuthTest do
  use Pulap.DataCase

  alias Pulap.Auth

  describe "users" do
    alias Pulap.Auth.User

    @valid_attrs %{annotations: "some annotations", card: "some card", email: "some email", family_name: "some family_name", geolocation: 42, given_name: "some given_name", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, middle_names: "some middle_names", password_hash: "some password_hash", started_at: "2010-04-17 14:00:00.000000Z", username: "some username"}
    @update_attrs %{annotations: "some updated annotations", card: "some updated card", email: "some updated email", family_name: "some updated family_name", geolocation: 43, given_name: "some updated given_name", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, middle_names: "some updated middle_names", password_hash: "some updated password_hash", started_at: "2011-05-18 15:01:01.000000Z", username: "some updated username"}
    @invalid_attrs %{annotations: nil, card: nil, email: nil, family_name: nil, geolocation: nil, given_name: nil, id: nil, is_active: nil, is_logical_deleted: nil, middle_names: nil, password_hash: nil, started_at: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Auth.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Auth.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
      assert user.annotations == "some annotations"
      assert user.card == "some card"
      assert user.email == "some email"
      assert user.family_name == "some family_name"
      assert user.geolocation == 42
      assert user.given_name == "some given_name"
      assert user.id == "7488a646-e31f-11e4-aace-600308960662"
      assert user.is_active == true
      assert user.is_logical_deleted == true
      assert user.middle_names == "some middle_names"
      assert user.password_hash == "some password_hash"
      assert user.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Auth.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.annotations == "some updated annotations"
      assert user.card == "some updated card"
      assert user.email == "some updated email"
      assert user.family_name == "some updated family_name"
      assert user.geolocation == 43
      assert user.given_name == "some updated given_name"
      assert user.id == "7488a646-e31f-11e4-aace-600308960668"
      assert user.is_active == false
      assert user.is_logical_deleted == false
      assert user.middle_names == "some updated middle_names"
      assert user.password_hash == "some updated password_hash"
      assert user.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_user(user, @invalid_attrs)
      assert user == Auth.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end

  describe "organizations" do
    alias Pulap.Auth.Organization

    @valid_attrs %{annotations: "some annotations", card: "some card", default: "some default", description: "some description", id: "7488a646-e31f-11e4-aace-600308960662", is_active: true, is_logical_deleted: true, name: "some name", organizations: 42, owner_username: "some owner_username", started_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{annotations: "some updated annotations", card: "some updated card", default: "some updated default", description: "some updated description", id: "7488a646-e31f-11e4-aace-600308960668", is_active: false, is_logical_deleted: false, name: "some updated name", organizations: 43, owner_username: "some updated owner_username", started_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{annotations: nil, card: nil, default: nil, description: nil, id: nil, is_active: nil, is_logical_deleted: nil, name: nil, organizations: nil, owner_username: nil, started_at: nil}

    def organization_fixture(attrs \\ %{}) do
      {:ok, organization} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_organization()

      organization
    end

    test "list_organizations/0 returns all organizations" do
      organization = organization_fixture()
      assert Auth.list_organizations() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture()
      assert Auth.get_organization!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      assert {:ok, %Organization{} = organization} = Auth.create_organization(@valid_attrs)
      assert organization.annotations == "some annotations"
      assert organization.card == "some card"
      assert organization.default == "some default"
      assert organization.description == "some description"
      assert organization.id == "7488a646-e31f-11e4-aace-600308960662"
      assert organization.is_active == true
      assert organization.is_logical_deleted == true
      assert organization.name == "some name"
      assert organization.organizations == 42
      assert organization.owner_username == "some owner_username"
      assert organization.started_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture()
      assert {:ok, organization} = Auth.update_organization(organization, @update_attrs)
      assert %Organization{} = organization
      assert organization.annotations == "some updated annotations"
      assert organization.card == "some updated card"
      assert organization.default == "some updated default"
      assert organization.description == "some updated description"
      assert organization.id == "7488a646-e31f-11e4-aace-600308960668"
      assert organization.is_active == false
      assert organization.is_logical_deleted == false
      assert organization.name == "some updated name"
      assert organization.organizations == 43
      assert organization.owner_username == "some updated owner_username"
      assert organization.started_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_organization(organization, @invalid_attrs)
      assert organization == Auth.get_organization!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{}} = Auth.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture()
      assert %Ecto.Changeset{} = Auth.change_organization(organization)
    end
  end
end
