defmodule Bookchain.UsersBooksRequestsTest do
  use Bookchain.DataCase

  alias Bookchain.UsersBooksRequests

  describe "users_books_requests" do
    alias Bookchain.UsersBooksRequests.UserBookRequests

    @valid_attrs %{book: 42, status: 42, user: 42}
    @update_attrs %{book: 43, status: 43, user: 43}
    @invalid_attrs %{book: nil, status: nil, user: nil}

    def user_book_requests_fixture(attrs \\ %{}) do
      {:ok, user_book_requests} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UsersBooksRequests.create_user_book_requests()

      user_book_requests
    end

    test "list_users_books_requests/0 returns all users_books_requests" do
      user_book_requests = user_book_requests_fixture()
      assert UsersBooksRequests.list_users_books_requests() == [user_book_requests]
    end

    test "get_user_book_requests!/1 returns the user_book_requests with given id" do
      user_book_requests = user_book_requests_fixture()
      assert UsersBooksRequests.get_user_book_requests!(user_book_requests.id) == user_book_requests
    end

    test "create_user_book_requests/1 with valid data creates a user_book_requests" do
      assert {:ok, %UserBookRequests{} = user_book_requests} = UsersBooksRequests.create_user_book_requests(@valid_attrs)
      assert user_book_requests.book == 42
      assert user_book_requests.status == 42
      assert user_book_requests.user == 42
    end

    test "create_user_book_requests/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UsersBooksRequests.create_user_book_requests(@invalid_attrs)
    end

    test "update_user_book_requests/2 with valid data updates the user_book_requests" do
      user_book_requests = user_book_requests_fixture()
      assert {:ok, %UserBookRequests{} = user_book_requests} = UsersBooksRequests.update_user_book_requests(user_book_requests, @update_attrs)
      assert user_book_requests.book == 43
      assert user_book_requests.status == 43
      assert user_book_requests.user == 43
    end

    test "update_user_book_requests/2 with invalid data returns error changeset" do
      user_book_requests = user_book_requests_fixture()
      assert {:error, %Ecto.Changeset{}} = UsersBooksRequests.update_user_book_requests(user_book_requests, @invalid_attrs)
      assert user_book_requests == UsersBooksRequests.get_user_book_requests!(user_book_requests.id)
    end

    test "delete_user_book_requests/1 deletes the user_book_requests" do
      user_book_requests = user_book_requests_fixture()
      assert {:ok, %UserBookRequests{}} = UsersBooksRequests.delete_user_book_requests(user_book_requests)
      assert_raise Ecto.NoResultsError, fn -> UsersBooksRequests.get_user_book_requests!(user_book_requests.id) end
    end

    test "change_user_book_requests/1 returns a user_book_requests changeset" do
      user_book_requests = user_book_requests_fixture()
      assert %Ecto.Changeset{} = UsersBooksRequests.change_user_book_requests(user_book_requests)
    end
  end
end
