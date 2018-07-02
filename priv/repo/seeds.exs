# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pulap.Repo.insert!(%Pulap.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
require Logger
alias Pulap.Repo
alias Pulap.Auth.User
alias Pulap.Auth.Organization
alias Pulap.Auth.Role
alias Pulap.Auth.UserRole
alias Pulap.Biz.RealEstate
alias Pulap.Biz.Managership
alias Pulap.Biz.Ownership
alias Pulap.App.KeyValue
alias PulapWeb.ControllersHelpers, as: Helper

## Start and end datetimes
start_date = Pulap.Util.Time.now_timestamp(:micro_seconds)
valid_until_date = Pulap.Util.Time.sample_date_timestamp()

# Roles --------------------------------------------------------------------------------------------------------------
# Superadmin
data = %{name: "superadmin", description: "Superadmin.", active: true, is_logical_deleted: false}
changeset = Role.changeset(%Role{}, data)
superadmin_role = Repo.insert!(changeset)

# Admin
data = %{name: "admin", description: "Admin.", active: true, is_logical_deleted: false}
changeset = Role.changeset(%Role{}, data)
admin_role = Repo.insert!(changeset)

# Enterprise Owner
data = %{
  name: "enterprise-owner",
  description: "Enterprise Owner",
  active: true,
  is_logical_deleted: false
}

changeset = Role.changeset(%Role{}, data)
enterprise_owner_role = Repo.insert!(changeset)

# Enterprise Admin
data = %{
  name: "enterprise-admin",
  description: "Enterprise admin",
  activeive: true,
  is_logical_deleted: false
}

changeset = Role.changeset(%Role{}, data)
enterprise_admin_role = Repo.insert!(changeset)

# Enterprise Manager
data = %{
  name: "enterprise-manager",
  description: "Enterprise manager",
  active: true,
  is_logical_deleted: false
}

changeset = Role.changeset(%Role{}, data)
enterprise_manager_role = Repo.insert!(changeset)

# Agency Owner
data = %{
  name: "agency-owner",
  description: "Agency Owner",
  description: "Agency onwer",
  active: true,
  is_logical_deleted: false
}

changeset = Role.changeset(%Role{}, data)
agency_owner_role = Repo.insert!(changeset)

# Agency Admin
data = %{
  name: "agency-admin",
  description: "Agency admin.",
  activeive: true,
  is_logical_deleted: false
}

changeset = Role.changeset(%Role{}, data)
agency_admin_role = Repo.insert!(changeset)

# Agency Manager
data = %{
  name: "agency-manager",
  description: "Agency manager.",
  active: true,
  is_logical_deleted: false
}

changeset = Role.changeset(%Role{}, data)
admin_role = Repo.insert!(changeset)

# PrivateOfferer
data = %{
  name: "private-offerer",
  description: "Private offerer.",
  active: true,
  is_logical_deleted: false
}

changeset = Role.changeset(%Role{}, data)
private_offerer_role = Repo.insert!(changeset)

# User
data = %{name: "user", description: "User.", active: true, is_logical_deleted: false}
changeset = Role.changeset(%Role{}, data)
user_role = Repo.insert!(changeset)

# Users --------------------------------------------------------------------------------------------------------------
## Superadmin
data = %{
  username: "superadmin",
  password: "password",
  email: "supearadmin@localhost.com",
  given_name: "Superadmin",
  middle_names: "Middle",
  family_name: "Family",
  context_id: nil,
  active: true,
  is_logical_deleted: false
}

changeset = User.signup_changeset(%User{}, data)
# superadmin_user = Repo.insert! Helper.update_roles(changeset, [superadmin_role])
superadmin_user = Repo.insert!(changeset)

# Organizations --------------------------------------------------------------------------------------------------------------
## Pulap
data = %{
  owner_username: superadmin_user.username,
  owner_id: superadmin_user.id,
  name: "Pulap",
  description: "App owner"
}

changeset = Organization.changeset(%Organization{}, data)
pulap_organization = Repo.insert!(changeset)

# UserRoles --------------------------------------------------------------------------------------------------------------
## Superadmin
data = %{
  organization_id: pulap_organization.id,
  user_id: superadmin_user.id,
  role_id: superadmin_role.id,
  active: true,
  is_logical_deleted: false
}

Logger.debug("Data: " <> inspect(data))
changeset = UserRole.changeset(%UserRole{}, data)
# changeset            = Helper.update_organization(changeset, pulap_organization)
# changeset            = Helper.update_user(changeset, superadmin_user)
# changeset            = Helper.update_role(changeset, superadmin_role)
superadmin_user_role = Repo.insert!(changeset)

# RealEstate --------------------------------------------------------------------------------------------------------------
## RealEstate One
data = %{name: "RealEstate One", description: "RealEstate One description"}
changeset = RealEstate.changeset(%RealEstate{}, data)
real_estate_one = Repo.insert!(changeset)

## RealEstate Two
data = %{name: "RealEstate Two", description: "RealEstate Two description"}
changeset = RealEstate.changeset(%RealEstate{}, data)
real_estate_two = Repo.insert!(changeset)

# Ownership --------------------------------------------------------------------------------------------------------------
## Real Estate One Ownership
data = %{
  name: "superadmin - real estate one",
  organization_id: pulap_organization.id,
  user_id: superadmin_user.id,
  real_estate_id: real_estate_one.id,
  active: true,
  is_logical_deleted: false
}

Logger.debug("Data: " <> inspect(data))
changeset = Ownership.changeset(%Ownership{}, data)
real_estate_one_ownership = Repo.insert!(changeset)

## Real Estate Two Ownership
data = %{
  name: "superadmin - real estate two",
  user_id: superadmin_user.id,
  real_estate_id: real_estate_two.id,
  active: true,
  is_logical_deleted: false
}

changeset = Ownership.changeset(%Ownership{}, data)
real_estate_two_ownership = Repo.insert!(changeset)

# Managership --------------------------------------------------------------------------------------------------------------
## Real Estate One Managership
data = %{
  name: "superadmin - real estate one",
  organization_id: pulap_organization.id,
  user_id: superadmin_user.id,
  real_estate_id: real_estate_one.id,
  is_owner: true,
  active: true,
  is_logical_deleted: false
}

Logger.debug("Data: " <> inspect(data))
changeset = Managership.changeset(%Managership{}, data)
real_estate_one_managership = Repo.insert!(changeset)

## Real Estate Two Managership
data = %{
  name: "superadmin - real estate two",
  user_id: superadmin_user.id,
  real_estate_id: real_estate_two.id,
  is_owner: true,
  active: true,
  is_logical_deleted: false
}

changeset = Managership.changeset(%Managership{}, data)
real_estate_two_managership = Repo.insert!(changeset)
