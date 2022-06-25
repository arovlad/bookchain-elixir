defmodule BookchainWeb.UserBookRequestsController do
  use BookchainWeb, :controller

  alias Bookchain.UsersBooksRequests
  alias Bookchain.UsersBooksRequests.UserBookRequests

  def index(conn, _params) do
    users_books_requests = UsersBooksRequests.list_users_books_requests()
    render(conn, "index.html", users_books_requests: users_books_requests)
  end

  def new(conn, _params) do
    changeset = UsersBooksRequests.change_user_book_requests(%UserBookRequests{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_book_requests" => user_book_requests_params}) do
    case UsersBooksRequests.create_user_book_requests(user_book_requests_params) do
      {:ok, user_book_requests} ->
        conn
        |> put_flash(:info, "Request sent successfully.")
        |> redirect(to: Routes.book_path(conn, :index))
        # |> redirect(to: Routes.user_book_requests_path(conn, :show, user_book_requests))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_book_requests = UsersBooksRequests.get_user_book_requests!(id)
    render(conn, "show.html", user_book_requests: user_book_requests)
  end

  def edit(conn, %{"id" => id}) do
    user_book_requests = UsersBooksRequests.get_user_book_requests!(id)
    changeset = UsersBooksRequests.change_user_book_requests(user_book_requests)
    render(conn, "edit.html", user_book_requests: user_book_requests, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_book_requests" => user_book_requests_params}) do
    user_book_requests = UsersBooksRequests.get_user_book_requests!(id)

    case UsersBooksRequests.update_user_book_requests(user_book_requests, user_book_requests_params) do
      {:ok, user_book_requests} ->
        conn
        |> put_flash(:info, "User book requests updated successfully.")
        |> redirect(to: Routes.user_book_requests_path(conn, :show, user_book_requests))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user_book_requests: user_book_requests, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_book_requests = UsersBooksRequests.get_user_book_requests!(id)
    {:ok, _user_book_requests} = UsersBooksRequests.delete_user_book_requests(user_book_requests)

    conn
    |> put_flash(:info, "User book requests deleted successfully.")
    |> redirect(to: Routes.user_book_requests_path(conn, :index))
  end
end
