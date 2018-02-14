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
alias PulapWeb.ControllersHelpers, as: Helper

## Start and end datetimes
start_date = Pulap.Util.Time.now_timestamp(:micro_seconds)
valid_until_date = Pulap.Util.Time.sample_date_timestamp()

# Roles --------------------------------------------------------------------------------------------------------------
# Superadmin
data            = %{hash_id: UUID.uuid1(), name: "superadmin", description: "Superadmin", description: "Superadmin.", active: true, logical_deleted: false}
changeset       = Role.changeset(%Role{}, data)
superadmin_role = Repo.insert! changeset

# Admin
data       = %{hash_id: UUID.uuid1(), name: "admin", description: "Admin", description: "Admin.", active: true, logical_deleted: false}
changeset  = Role.changeset(%Role{}, data)
admin_role = Repo.insert! changeset

# Enterprise Owner
data                  = %{hash_id: UUID.uuid1(), name: "enterprise-owner", description: "Enterprise Owner", description: "Enterprise onwer.", active: true, logical_deleted: false}
changeset             = Role.changeset(%Role{}, data)
enterprise_owner_role = Repo.insert! changeset

# Enterprise Admin
data                  = %{hash_id: UUID.uuid1(), name: "enterprise-admin", description: "Enterprise Admin", description: "Enterprise admin", activeive: true, logical_deleted: false}
changeset             = Role.changeset(%Role{}, data)
enterprise_admin_role = Repo.insert! changeset

# Enterprise Manager
data                    = %{hash_id: UUID.uuid1(), name: "enterprise-manager", description: "Enterprise Manager", description: "Enterprise manager", active: true, logical_deleted: false}
changeset               = Role.changeset(%Role{}, data)
enterprise_manager_role = Repo.insert! changeset

# Agency Owner
data              = %{hash_id: UUID.uuid1(), name: "agency-owner", description: "Agency Owner", description: "Agency onwer", active: true, logical_deleted: false}
changeset         = Role.changeset(%Role{}, data)
agency_owner_role = Repo.insert! changeset

# Agency Admin
data              = %{hash_id: UUID.uuid1(), name: "agency-admin", description: "Agency Admin", description: "Agency admin", activeive: true, logical_deleted: false}
changeset         = Role.changeset(%Role{}, data)
agency_admin_role = Repo.insert! changeset

# Agency Manager
data       = %{hash_id: UUID.uuid1(), name: "agency-manager", description: "Agency Manager", description: "Agency manager", active: true, logical_deleted: false}
changeset  = Role.changeset(%Role{}, data)
admin_role = Repo.insert! changeset

# PrivateOfferer
data                 = %{hash_id: UUID.uuid1(), name: "private-offerer", description: "Private Offerer", description: "Private offerer", active: true, logical_deleted: false}
changeset            = Role.changeset(%Role{}, data)
private_offerer_role = Repo.insert! changeset

# User
data                 = %{hash_id: UUID.uuid1(), name: "user", description: "User", description: "User.", active: true, logical_deleted: false}
changeset            = Role.changeset(%Role{}, data)
user_role = Repo.insert! changeset

# Users --------------------------------------------------------------------------------------------------------------
## Superadmin
data      = %{hash_id: UUID.uuid1(), username: "superadmin", password: "password", email: "supearadmin@localhost.com", given_name: "Superadmin", middle_names: "Middle", family_name: "Family", active: true, logical_deleted: false}
changeset       = User.signup_changeset(%User{}, data)
superadmin_user = Repo.insert! Helper.update_roles(changeset, [superadmin_role])

## Admin
data      = %{hash_id: UUID.uuid1(), username: "admin", password: "password", email: "admin@localhost.com", given_name: "Admin", middle_names: "Middle", family_name: "Family", active: true, logical_deleted: false}
changeset = User.signup_changeset(%User{}, data)
user      = Repo.insert! Helper.update_roles(changeset, [admin_role])

## Private Offerer
data      = %{hash_id: UUID.uuid1(), username: "privateofferer", password: "password", email: "privateofferer@localhost.com", given_name: "Private", middle_names: "Offerer", family_name: "Family", active: true, logical_deleted: false}
changeset = User.signup_changeset(%User{}, data)
user      = Repo.insert! Helper.update_roles(changeset, [private_offerer_role])

## User
data      = %{hash_id: UUID.uuid1(), username: "user", password: "password", email: "user@localhost.com", given_name: "User", middle_names: "Middle", family_name: "Family", active: true, logical_deleted: false}
changeset = User.signup_changeset(%User{}, data)
sample_user = Repo.insert! Helper.update_roles(changeset, [user])

