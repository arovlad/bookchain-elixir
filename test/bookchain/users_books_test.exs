defmodule Bookchain.UsersBooksTest do
  use Bookchain.DataCase

  alias Bookchain.UsersBooks

  describe "users_books" do
    alias Bookchain.UsersBooks.UserBook

    @valid_attrs %{book: 42, user: 42}
    @update_attrs %{book: 43, user: 43}
    @invalid_attrs %{book: nil, user: nil}

    def user_book_fixture(attrs \\ %{}) do
      {:ok, user_book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UsersBooks.create_user_book()

      user_book
    end

    test "list_users_books/0 returns all users_books" do
      user_book = user_book_fixture()
      assert UsersBooks.list_users_books() == [user_book]
    end

    test "get_user_book!/1 returns the user_book with given id" do
      user_book = user_book_fixture()
      assert UsersBooks.get_user_book!(user_book.id) == user_book
    end

    test "create_user_book/1 with valid data creates a user_book" do
      assert {:ok, %UserBook{} = user_book} = UsersBooks.create_user_book(@valid_attrs)
      assert user_book.book == 42
      assert user_book.user == 42
    end

    test "create_user_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UsersBooks.create_user_book(@invalid_attrs)
    end

    test "update_user_book/2 with valid data updates the user_book" do
      user_book = user_book_fixture()
      assert {:ok, %UserBook{} = user_book} = UsersBooks.update_user_book(user_book, @update_attrs)
      assert user_book.book == 43
      assert user_book.user == 43
    end

    test "update_user_book/2 with invalid data returns error changeset" do
      user_book = user_book_fixture()
      assert {:error, %Ecto.Changeset{}} = UsersBooks.update_user_book(user_book, @invalid_attrs)
      assert user_book == UsersBooks.get_user_book!(user_book.id)
    end

    test "delete_user_book/1 deletes the user_book" do
      user_book = user_book_fixture()
      assert {:ok, %UserBook{}} = UsersBooks.delete_user_book(user_book)
      assert_raise Ecto.NoResultsError, fn -> UsersBooks.get_user_book!(user_book.id) end
    end

    test "change_user_book/1 returns a user_book changeset" do
      user_book = user_book_fixture()
      assert %Ecto.Changeset{} = UsersBooks.change_user_book(user_book)
    end
  end
end
