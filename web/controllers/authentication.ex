defmodule ActioncableExamples.Authentication do
  alias ActioncableExamples.Repo
  use ActioncableExamples.Web, :controller
  use ActioncableExamples.Web, :router

  def ensure_authenticated_user(conn) do
    user_id = Plug.Conn.get_session(conn, :user_id)
    if user_id do
      Repo.get(ActioncableExamples.User, user_id)
    else
      conn |> redirect(to: sessions_path(conn, :new)) |> halt
    end
  #    authenticate_user(cookies.signed[:user_id]) || redirect_to(new_session_url)
  end

  def authenticate_user(_) do
    # if authenticated_user = User.find_by(id: user_id)
    #   cookies.signed[:user_id] ||= user_id
    #   @current_user = authenticated_user
    # end
  end

  def unauthenticate_user do
    # ActionCable.server.disconnect(current_user: @current_user)
    # @current_user = nil
    # cookies.delete(:user_id)
  end
end
