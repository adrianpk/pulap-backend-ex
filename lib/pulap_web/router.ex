defmodule PulapWeb.Router do
  use PulapWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PulapWeb do
    pipe_through :api
    resources "/users", UserController do
      get "/profile/edit", ProfileController, :edit
      get "/profile", ProfileController, :show
      patch "/profile", ProfileController, :update
      put "/profile", ProfileController, :update
    end
    resources "/organizations", OrganizationController do
    end
    resources "/roles", RoleController do
      # nested resources
    end
    resources "/permissions", PermissionController do
      # nested resources
    end
    resources "/resources", ResourceController do
      # nested resources
    end
    resources "/role-permissions", RolePermissionController do
      # nested resources
    end
    resources "/resource-permissions", ResourcePermissionController do
      # nested resources
    end
    resources "/user-roles", UserRoleController do
      # nested resources
    end
    resources "/property-sets", PropertySetController do
      # nested resources
    end
    resources "/properties", PropertyController do
      # nested resources
    end
  end
end
