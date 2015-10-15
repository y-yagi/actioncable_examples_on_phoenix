defmodule ActioncableExamples.MessageController do
  use ActioncableExamples.Web, :controller
  alias ActioncableExamples.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.html", messages: messages)
  end

  def show(conn, %{"id" => id}) do
    message = Repo.get!(Message, id)
    render(conn, "show.html", message: message)
  end
end
