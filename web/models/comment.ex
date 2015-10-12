defmodule ActioncableExamples.Comment do
  use ActioncableExamples.Web, :model

  schema "comments" do
    field :content, :string
    belongs_to :message, ActioncableExamples.Message
    belongs_to :user, ActioncableExamples.User

    timestamps
  end

  @required_fields ~w(content)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
