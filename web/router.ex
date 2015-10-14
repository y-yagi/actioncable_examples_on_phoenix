defmodule ActioncableExamples.Router do
  use ActioncableExamples.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ActioncableExamples do
    pipe_through :browser # Use the default browser stack

    get "/", ExamplesController, :index
    get  "/sessions/new", SessionsController, :new
    post "/sessions", SessionsController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", ActioncableExamples do
  #   pipe_through :api
  # end
end
