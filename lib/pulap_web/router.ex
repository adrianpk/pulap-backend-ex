defmodule PulapWeb.Router do
  use PulapWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :authenticated do
    # , repo: Pulap.Repo
    plug(PulapWeb.Auth.AuthPipeline)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:put_format, :json)
    plug(Corsica, origins: ["http://localhost:3449"], allow_headers: ["content-type"])
  end

  scope "/api", PulapWeb.API, as: :api do
    pipe_through(:api)

    scope "/v1", V1, as: :v1 do
      resources "/users", UserController do
        get("/profile/edit", ProfileController, :edit)
        get("/profile", ProfileController, :show)
        patch("/profile", ProfileController, :update)
        put("/profile", ProfileController, :update)
      end

      resources "/organizations", OrganizationController do
        # nested resources
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

      resources "/managerships", ManagershipController do
        # nested resources
      end
    end
  end

  scope "/", PulapWeb.HTML do
    pipe_through([:browser, :authenticated])
    # # Page
    # get "/", PageController, :index
    # # Signup
    # get "/signup", UserController, :init_signup
    # post "/signup", UserController, :signup
    # # Signin / Signout
    # get "/signin", SessionController, :new
    # post "/signin", SessionController, :create
    get("/signout", SessionController, :delete)
    resources("/sessions", SessionController, only: [:delete])
    # Dashboard
    get("/dashboard", DashboardController, :index)
    # Resources
    resources "/users", UserController do
      # get "/profile/edit", ProfileController, :edit
      # get "/profile", ProfileController, :show
      # patch "/profile", ProfileController, :update
      # put "/profile", ProfileController, :update
    end

    # resources "/real-estate", RealEstateController do
    #   # nested resource
    # end

    scope "/managed", Managed do
      get("/real-estate", RealEstateController, :index)
      get("/real-estate/new", RealEstateController, :new)
      post("/real-estate", RealEstateController, :create)
      get("/real-estate/:id/presentation", RealEstateController, :edit_presentation)
      post("/real-estate/:id/presentation", RealEstateController, :edit_presentation)
      patch("/real-estate/:id/presentation", RealEstateController, :update_presentation)
      put("/real-estate/:id/presentation", RealEstateController, :update_presentation)
      get("/real-estate/:id/address", RealEstateController, :edit_address)
      post("/real-estate/:id/address", RealEstateController, :edit_address)
      patch("/real-estate/:id/address", RealEstateController, :update_address)
      put("/real-estate/:id/address", RealEstateController, :update_address)
      get("/real-estate/:id/main-features", RealEstateController, :edit_main_features)
      post("/real-estate/:id/main-features", RealEstateController, :edit_main_features)
      post("/real-estate/:id/main-features", RealEstateController, :edit_main_features)
      patch("/real-estate/:id/main-features", RealEstateController, :update_main_features)
      put("/real-estate/:id/main-features", RealEstateController, :update_main_features)
      get("/real-estate/:id/services", RealEstateController, :edit_services)
      post("/real-estate/:id/services", RealEstateController, :edit_services)
      patch("/real-estate/:id/services", RealEstateController, :update_services)
      put("/real-estate/:id/services", RealEstateController, :update_services)
      get("/real-estate/:id/equipment", RealEstateController, :edit_equipment)
      post("/real-estate/:id/equipment", RealEstateController, :edit_equipment)
      patch("/real-estate/:id/equipment", RealEstateController, :update_equipment)
      put("/real-estate/:id/equipment", RealEstateController, :update_equipment)
      get("/real-estate/:id/prices", RealEstateController, :edit_prices)
      post("/real-estate/:id/prices", RealEstateController, :edit_prices)
      patch("/real-estate/:id/prices", RealEstateController, :update_prices)
      put("/real-estate/:id/prices", RealEstateController, :update_prices)
      # resources "/real-estate", RealEstateController do
      # end
    end
  end

  scope "/", PulapWeb.HTML do
    pipe_through(:browser)
    # Page
    get("/", PageController, :index)
    # Signup
    get("/signup", UserController, :init_signup)
    post("/signup", UserController, :signup)
    # Signin / Signout
    get("/signin", SessionController, :new)
    post("/signin", SessionController, :create)
    resources("/sessions", SessionController, only: [:new, :create])
  end
end
