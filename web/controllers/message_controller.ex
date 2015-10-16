defmodule ActioncableExamples.MessageController do
  use ActioncableExamples.Web, :controller
  alias ActioncableExamples.Message
  alias ActioncableExamples.Comment

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.html", messages: messages)
  end

  def show(conn, %{"id" => id}) do
    message = Repo.get!(Message, id)
    comment_changeset = Comment.changeset(%Comment{})
    render(conn, "show.html", message: message, comment_changeset: comment_changeset)
  end
end
