defmodule ActioncableExamples.ExamplesController do
  use ActioncableExamples.Web, :controller
  plug :authenticate

  def index(conn, _params) do
    render(conn, "index.html")
  end

  defp authenticate(conn, _) do
    Authentication.ensure_authenticated_user(conn)
  end
end
