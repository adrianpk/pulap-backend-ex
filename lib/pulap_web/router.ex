defmodule PulapWeb.Router do
  use PulapWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PulapWeb do
    pipe_through :api
  end
end
