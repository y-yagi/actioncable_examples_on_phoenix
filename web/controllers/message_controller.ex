defmodule ActioncableExamples.MessageController do
  use ActioncableExamples.Web, :controller
  alias ActioncableExamples.Message
  alias ActioncableExamples.Comment
  plug :authenticate

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.html", messages: messages)
  end

  def show(conn, %{"id" => id}) do
    message = Message |> Repo.get(id) |> Repo.preload [:comments]
    render(conn, "show.html", message: message)
  end

  defp authenticate(conn, _) do
    Authentication.ensure_authenticated_user(conn)
  end
end
