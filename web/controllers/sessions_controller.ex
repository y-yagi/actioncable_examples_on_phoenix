defmodule ActioncableExamples.SessionsController do
  use ActioncableExamples.Web, :controller

  def new(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def create(conn, _params) do
    redirect(conn, to: examples_path(conn, :index))
  end

  def delete(conn, _params) do
    redirect(conn, to: sessions_path(conn, :new))
  end
end
