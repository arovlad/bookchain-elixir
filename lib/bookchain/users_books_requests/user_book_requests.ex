defmodule Bookchain.UsersBooksRequests.UserBookRequests do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_books_requests" do
    field :book, :integer
    field :status, :integer
    field :user, :integer

    timestamps()
  end

  @doc false
  def changeset(user_book_requests, attrs) do
    user_book_requests
    |> cast(attrs, [:user, :book, :status])
    |> validate_required([:user, :book, :status])
  end
end
