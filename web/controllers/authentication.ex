defmodule ActioncableExamples.Authentication do
  alias ActioncableExamples.Repo
  use ActioncableExamples.Web, :controller
  use ActioncableExamples.Web, :router

  def ensure_authenticated_user(conn) do
    user_id = get_session(conn, :user_id)
    Logger.info("user_id: #{user_id}")

    if user_id do
      Repo.get(ActioncableExamples.User, user_id)
    else
      conn |> redirect(to: sessions_path(conn, :new)) |> halt
    end
  end

  def authenticate_user(conn, user_id) do
    if authenticated_user = Repo.get(ActioncableExamples.User, user_id) do
      conn = put_session(conn, :user_id, user_id)
    end
    conn
  end

  def unauthenticate_user(conn) do
    # ActionCable.server.disconnect(current_user: @current_user)
    delete_session(conn, :user_id)
  end
end
