defmodule BookchainWeb.UserBookControllerTest do
  use BookchainWeb.ConnCase

  alias Bookchain.UsersBooks

  @create_attrs %{book: 42, user: 42}
  @update_attrs %{book: 43, user: 43}
  @invalid_attrs %{book: nil, user: nil}

  def fixture(:user_book) do
    {:ok, user_book} = UsersBooks.create_user_book(@create_attrs)
    user_book
  end

  describe "index" do
    test "lists all users_books", %{conn: conn} do
      conn = get(conn, Routes.user_book_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Users books"
    end
  end

  describe "new user_book" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_book_path(conn, :new))
      assert html_response(conn, 200) =~ "New User book"
    end
  end

  describe "create user_book" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_book_path(conn, :create), user_book: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_book_path(conn, :show, id)

      conn = get(conn, Routes.user_book_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User book"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_book_path(conn, :create), user_book: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User book"
    end
  end

  describe "edit user_book" do
    setup [:create_user_book]

    test "renders form for editing chosen user_book", %{conn: conn, user_book: user_book} do
      conn = get(conn, Routes.user_book_path(conn, :edit, user_book))
      assert html_response(conn, 200) =~ "Edit User book"
    end
  end

  describe "update user_book" do
    setup [:create_user_book]

    test "redirects when data is valid", %{conn: conn, user_book: user_book} do
      conn = put(conn, Routes.user_book_path(conn, :update, user_book), user_book: @update_attrs)
      assert redirected_to(conn) == Routes.user_book_path(conn, :show, user_book)

      conn = get(conn, Routes.user_book_path(conn, :show, user_book))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user_book: user_book} do
      conn = put(conn, Routes.user_book_path(conn, :update, user_book), user_book: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User book"
    end
  end

  describe "delete user_book" do
    setup [:create_user_book]

    test "deletes chosen user_book", %{conn: conn, user_book: user_book} do
      conn = delete(conn, Routes.user_book_path(conn, :delete, user_book))
      assert redirected_to(conn) == Routes.user_book_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_book_path(conn, :show, user_book))
      end
    end
  end

  defp create_user_book(_) do
    user_book = fixture(:user_book)
    %{user_book: user_book}
  end
end
