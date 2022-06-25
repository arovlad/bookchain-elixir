defmodule BookchainWeb.UserBookController do
  use BookchainWeb, :controller

  alias Bookchain.UsersBooks
  alias Bookchain.UsersBooks.UserBook

  def index(conn, _params) do
    users_books = UsersBooks.list_users_books()
    render(conn, "index.html", users_books: users_books)
  end

  def new(conn, _params) do
    changeset = UsersBooks.change_user_book(%UserBook{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_book" => user_book_params}) do
    case UsersBooks.create_user_book(user_book_params) do
      {:ok, user_book} ->
        conn
        # |> put_flash(:info, "User book created successfully.")
        # |> redirect(to: Routes.user_book_path(conn, :show, user_book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_book = UsersBooks.get_user_book!(id)
    render(conn, "show.html", user_book: user_book)
  end

  def edit(conn, %{"id" => id}) do
    user_book = UsersBooks.get_user_book!(id)
    changeset = UsersBooks.change_user_book(user_book)
    render(conn, "edit.html", user_book: user_book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_book" => user_book_params}) do
    user_book = UsersBooks.get_user_book!(id)

    case UsersBooks.update_user_book(user_book, user_book_params) do
      {:ok, user_book} ->
        conn
        |> put_flash(:info, "User book updated successfully.")
        |> redirect(to: Routes.user_book_path(conn, :show, user_book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user_book: user_book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_book = UsersBooks.get_user_book!(id)
    {:ok, _user_book} = UsersBooks.delete_user_book(user_book)

    conn
    |> put_flash(:info, "User book deleted successfully.")
    |> redirect(to: Routes.user_book_path(conn, :index))
  end
end
