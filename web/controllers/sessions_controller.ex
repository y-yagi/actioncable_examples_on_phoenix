defmodule ActioncableExamples.SessionsController do
  use ActioncableExamples.Web, :controller
  alias ActioncableExamples.User

  def new(conn, _params) do
    users = Repo.all(User)
    render(conn, "new.html", users: users)
  end

  def create(conn, _params) do
    conn = Authentication.authenticate_user(conn, _params["user_id"])
    redirect(conn, to: examples_path(conn, :index))
  end

  def delete(conn, _params) do
    conn = Authentication.unauthenticate_user(conn)
    redirect(conn, to: sessions_path(conn, :new))
  end
end
