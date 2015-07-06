defmodule PhoenixTutorial.Router do
  use PhoenixTutorial.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixTutorial do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController
    resources "posts", PostController, only: [:index, :show]
    resources "comments", CommentController, except: [:delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixTutorial do
  #   pipe_through :api
  # end
end
