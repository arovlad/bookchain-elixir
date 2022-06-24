defmodule Bookchain.Repo.Migrations.CreateUsersBooks do
  use Ecto.Migration

  def change do
    create table(:users_books) do
      add :user, :integer
      add :book, :integer

      timestamps()
    end

  end
end
