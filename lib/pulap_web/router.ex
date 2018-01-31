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
  end
end
