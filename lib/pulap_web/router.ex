defmodule PulapWeb.Router do
  use PulapWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PulapWeb.Auth.AuthPlug
  end

  pipeline :api do
    # plug :accepts, ["json"]
    plug :put_format, :json
  end

  scope "/api/v1", PulapWeb do
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
    resources "/key-values", KeyValueController do
      # nested resources
    end
    resources "/plans", PlanController do
      # nested resources
    end
    resources "/plan-subscriptions", PlanSubscriptionController do
      # nested resources
    end
    resources "/geo-areas", GeoAreaController do
      # nested resources
    end
    resources "/currencies", CurrencyController do
      # nested resources
    end
    resources "/real-estate", RealEstateController do
      # nested resources
    end
    resources "/tenures", TenureController do
      # nested resources
    end
    resources "/tenures", TenureController do
      # nested resources
    end
    resources "/administratorships", AdministratorshipController do
      # nested resources
    end
  end
end
