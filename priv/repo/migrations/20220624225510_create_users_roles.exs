defmodule Bookchain.Repo.Migrations.CreateUsersRoles do
  use Ecto.Migration

  def change do
    create table(:users_roles) do
      add :user, :integer
      add :role, :integer

      timestamps()
    end

  end
end
