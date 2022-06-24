defmodule Bookchain.UsersBooks do
  @moduledoc """
  The UsersBooks context.
  """

  import Ecto.Query, warn: false
  alias Bookchain.Repo

  alias Bookchain.UsersBooks.UserBook

  @doc """
  Returns the list of users_books.

  ## Examples

      iex> list_users_books()
      [%UserBook{}, ...]

  """
  def list_users_books do
    Repo.all(UserBook)
  end

  @doc """
  Gets a single user_book.

  Raises `Ecto.NoResultsError` if the User book does not exist.

  ## Examples

      iex> get_user_book!(123)
      %UserBook{}

      iex> get_user_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_book!(id), do: Repo.get!(UserBook, id)

  @doc """
  Creates a user_book.

  ## Examples

      iex> create_user_book(%{field: value})
      {:ok, %UserBook{}}

      iex> create_user_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_book(attrs \\ %{}) do
    %UserBook{}
    |> UserBook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_book.

  ## Examples

      iex> update_user_book(user_book, %{field: new_value})
      {:ok, %UserBook{}}

      iex> update_user_book(user_book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_book(%UserBook{} = user_book, attrs) do
    user_book
    |> UserBook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_book.

  ## Examples

      iex> delete_user_book(user_book)
      {:ok, %UserBook{}}

      iex> delete_user_book(user_book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_book(%UserBook{} = user_book) do
    Repo.delete(user_book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_book changes.

  ## Examples

      iex> change_user_book(user_book)
      %Ecto.Changeset{data: %UserBook{}}

  """
  def change_user_book(%UserBook{} = user_book, attrs \\ %{}) do
    UserBook.changeset(user_book, attrs)
  end
end
