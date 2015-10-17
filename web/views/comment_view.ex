defmodule ActioncableExamples.CommentView do
  use ActioncableExamples.Web, :view
  def render("index.json", %{comments2: comments2}) do
    %{data: render_many(comments2, ActioncableExamples.CommentView, "Comment.json")}
  end

  def render("show.json", %{Comment: Comment}) do
    %{data: render_one(Comment, ActioncableExamples.CommentView, "Comment.json")}
  end

  def render("Comment.json", %{Comment: Comment}) do
    %{id: Comment.id,
      content: Comment.content}
  end
end
