defmodule Pulap.Repo.Migrations.CreateManagerships do
  use Ecto.Migration

  def change do
    create table(:managerships, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :started_at, :utc_datetime
      add :ends_at, :utc_datetime
      add :is_owner, :boolean, default: false, null: false
      add :is_active, :boolean, default: false, null: false
      add :is_logical_deleted, :boolean, default: false, null: false
      add :user_id, references(:users, type: :uuid, on_delete: :nothing)
      add :organization_id, references(:organizations, type: :uuid, on_delete: :nothing)
      add :real_estate_id, references(:real_estate, type: :uuid, on_delete: :nothing)
      add :created_by_id, references(:users, type: :uuid, on_delete: :nothing)
      add :updated_by_id, references(:users, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:managerships, [:user_id])
    create index(:managerships, [:organization_id])
    create index(:managerships, [:real_estate_id])
    create index(:managerships, [:created_by_id])
    create index(:managerships, [:updated_by_id])
  end
end
