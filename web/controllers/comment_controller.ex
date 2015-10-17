defmodule ActioncableExamples.CommentController do
  use ActioncableExamples.Web, :controller

  alias ActioncableExamples.Comment

  plug :scrub_params, "Comment" when action in [:create, :update]

  def index(conn, _params) do
    comments2 = Repo.all(Comment)
    render(conn, "index.json", comments2: comments2)
  end

  def create(conn, %{"Comment" => Comment_params}) do
    changeset = Comment.changeset(%Comment{}, Comment_params)

    case Repo.insert(changeset) do
      {:ok, Comment} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", comment_path(conn, :show, Comment))
        |> render("show.json", Comment: Comment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ActioncableExamples.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    Comment = Repo.get!(Comment, id)
    render(conn, "show.json", Comment: Comment)
  end

  def update(conn, %{"id" => id, "Comment" => Comment_params}) do
    Comment = Repo.get!(Comment, id)
    changeset = Comment.changeset(Comment, Comment_params)

    case Repo.update(changeset) do
      {:ok, Comment} ->
        render(conn, "show.json", Comment: Comment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ActioncableExamples.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    Comment = Repo.get!(Comment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(Comment)

    send_resp(conn, :no_content, "")
  end
end
