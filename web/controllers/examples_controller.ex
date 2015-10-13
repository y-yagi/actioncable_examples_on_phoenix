defmodule ActioncableExamples.ExamplesController do
  use ActioncableExamples.Web, :controller

  def index(conn, _params) do
    current_user = Authentication.ensure_authenticated_user
    render(conn, "index.html", current_user: current_user)
  end
end
