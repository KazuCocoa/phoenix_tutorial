defmodule PhoenixTutorial.PageController do
  use PhoenixTutorial.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
