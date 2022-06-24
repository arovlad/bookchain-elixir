defmodule BookchainWeb.UserBookRequestsControllerTest do
  use BookchainWeb.ConnCase

  alias Bookchain.UsersBooksRequests

  @create_attrs %{book: 42, status: 42, user: 42}
  @update_attrs %{book: 43, status: 43, user: 43}
  @invalid_attrs %{book: nil, status: nil, user: nil}

  def fixture(:user_book_requests) do
    {:ok, user_book_requests} = UsersBooksRequests.create_user_book_requests(@create_attrs)
    user_book_requests
  end

  describe "index" do
    test "lists all users_books_requests", %{conn: conn} do
      conn = get(conn, Routes.user_book_requests_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Users books requests"
    end
  end

  describe "new user_book_requests" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_book_requests_path(conn, :new))
      assert html_response(conn, 200) =~ "New User book requests"
    end
  end

  describe "create user_book_requests" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_book_requests_path(conn, :create), user_book_requests: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_book_requests_path(conn, :show, id)

      conn = get(conn, Routes.user_book_requests_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User book requests"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_book_requests_path(conn, :create), user_book_requests: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User book requests"
    end
  end

  describe "edit user_book_requests" do
    setup [:create_user_book_requests]

    test "renders form for editing chosen user_book_requests", %{conn: conn, user_book_requests: user_book_requests} do
      conn = get(conn, Routes.user_book_requests_path(conn, :edit, user_book_requests))
      assert html_response(conn, 200) =~ "Edit User book requests"
    end
  end

  describe "update user_book_requests" do
    setup [:create_user_book_requests]

    test "redirects when data is valid", %{conn: conn, user_book_requests: user_book_requests} do
      conn = put(conn, Routes.user_book_requests_path(conn, :update, user_book_requests), user_book_requests: @update_attrs)
      assert redirected_to(conn) == Routes.user_book_requests_path(conn, :show, user_book_requests)

      conn = get(conn, Routes.user_book_requests_path(conn, :show, user_book_requests))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user_book_requests: user_book_requests} do
      conn = put(conn, Routes.user_book_requests_path(conn, :update, user_book_requests), user_book_requests: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User book requests"
    end
  end

  describe "delete user_book_requests" do
    setup [:create_user_book_requests]

    test "deletes chosen user_book_requests", %{conn: conn, user_book_requests: user_book_requests} do
      conn = delete(conn, Routes.user_book_requests_path(conn, :delete, user_book_requests))
      assert redirected_to(conn) == Routes.user_book_requests_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_book_requests_path(conn, :show, user_book_requests))
      end
    end
  end

  defp create_user_book_requests(_) do
    user_book_requests = fixture(:user_book_requests)
    %{user_book_requests: user_book_requests}
  end
end
