defmodule ActioncableExamples.PageController do
  use ActioncableExamples.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
