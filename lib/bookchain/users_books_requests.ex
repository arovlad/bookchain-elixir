defmodule Bookchain.UsersBooksRequests do
  @moduledoc """
  The UsersBooksRequests context.
  """

  import Ecto.Query, warn: false
  alias Bookchain.Repo

  alias Bookchain.UsersBooksRequests.UserBookRequests

  @doc """
  Returns the list of users_books_requests.

  ## Examples

      iex> list_users_books_requests()
      [%UserBookRequests{}, ...]

  """
  def list_users_books_requests do
    Repo.all(UserBookRequests)
  end

  @doc """
  Gets a single user_book_requests.

  Raises `Ecto.NoResultsError` if the User book requests does not exist.

  ## Examples

      iex> get_user_book_requests!(123)
      %UserBookRequests{}

      iex> get_user_book_requests!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_book_requests!(id), do: Repo.get!(UserBookRequests, id)

  @doc """
  Creates a user_book_requests.

  ## Examples

      iex> create_user_book_requests(%{field: value})
      {:ok, %UserBookRequests{}}

      iex> create_user_book_requests(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_book_requests(attrs \\ %{}) do
    %UserBookRequests{}
    |> UserBookRequests.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_book_requests.

  ## Examples

      iex> update_user_book_requests(user_book_requests, %{field: new_value})
      {:ok, %UserBookRequests{}}

      iex> update_user_book_requests(user_book_requests, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_book_requests(%UserBookRequests{} = user_book_requests, attrs) do
    user_book_requests
    |> UserBookRequests.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_book_requests.

  ## Examples

      iex> delete_user_book_requests(user_book_requests)
      {:ok, %UserBookRequests{}}

      iex> delete_user_book_requests(user_book_requests)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_book_requests(%UserBookRequests{} = user_book_requests) do
    Repo.delete(user_book_requests)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_book_requests changes.

  ## Examples

      iex> change_user_book_requests(user_book_requests)
      %Ecto.Changeset{data: %UserBookRequests{}}

  """
  def change_user_book_requests(%UserBookRequests{} = user_book_requests, attrs \\ %{}) do
    UserBookRequests.changeset(user_book_requests, attrs)
  end
end
