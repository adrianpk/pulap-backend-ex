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

    resources "/real-estate", RealEstateController do
      # nested resource
    end

    scope "/managed", Managed do
      get("/real-estate/new", RealEstateController, :new)
      post("/real-estate", RealEstateController, :create)
      patch("/real-estate/:id", RealEstateController, :update)
      put("/real-estate/:id", RealEstateController, :update)
      get("/real-estate/step-two", RealEstateController, :edit_step_two)
      patch("/real-estate/:id/step-two", RealEstateController, :update_step_two)
      put("/real-estate/:id/step-two", RealEstateController, :update_step_two)
      get("/real-estate/step-three", RealEstateController, :edit_step_three)
      patch("/real-estate/:id/step-three", RealEstateController, :update_step_three)
      put("/real-estate/:id/step-three", RealEstateController, :update_step_three)
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
