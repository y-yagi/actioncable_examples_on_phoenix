defmodule ActioncableExamples.Authentication do
  alias ActioncableExamples.Repo
  import Ecto.Model
  import Ecto.Query, only: [from: 1, from: 2]

  def ensure_authenticated_user do
    ActioncableExamples.Repo.get!(ActioncableExamples.User, 11)
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
