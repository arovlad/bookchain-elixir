defmodule Bookchain.UsersBooks.UserBook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_books" do
    field :book, :integer
    field :user, :integer

    timestamps()
  end

  @doc false
  def changeset(user_book, attrs) do
    user_book
    |> cast(attrs, [:user, :book])
    |> validate_required([:user, :book])
  end
end
