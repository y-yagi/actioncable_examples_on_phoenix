defmodule ActioncableExamples.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text
      add :message_id, references(:messages)
      add :user_id, references(:users)

      timestamps
    end
    create index(:comments, [:message_id])
    create index(:comments, [:user_id])

  end
end
