defmodule Bookchain.Repo.Migrations.CreateUsersBooksRequests do
  use Ecto.Migration

  def change do
    create table(:users_books_requests) do
      add :user, :integer
      add :book, :integer
      add :status, :integer

      timestamps()
    end

  end
end
