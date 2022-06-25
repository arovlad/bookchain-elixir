defmodule BookchainWeb.BookController do
  use BookchainWeb, :controller

  alias Bookchain.UsersBooks
  alias Bookchain.Books
  alias Bookchain.Books.Book
  alias Bookchain.Users
  alias Bookchain.Users.User
  alias BookchainWeb.UserBookController

  def index(conn, _params) do
    books = Books.list_books()
    render(conn, "index.html", books: books)
  end

  plug :check_auth when action in [:new, :create, :edit, :update, :delete, :show, :index]
  # plug :create_user_book when action in [:create]

  defp check_auth(conn, _args) do
    if user_id = get_session(conn, :current_user_id) do
      current_user = Users.get_user!(user_id)

      conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You need to be signed in to access that page.")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end

  # defp create_user_book(conn, book_id) do
  #   current_user =  get_session(conn, :current_user_id)
  #   UserBookController.create(conn, %{"user_book" => %{"book" => book_id, "user" => current_user}})
  # end

  def new(conn, _params) do
    changeset = Books.change_book(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Books.create_book(book_params) do
      {:ok, book} ->
        current_user =  get_session(conn, :current_user_id)
        UserBookController.create(conn, %{"user_book" => %{"book" => book.id, "user" => current_user}})
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    changeset = Books.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Books.get_book!(id)

    case Books.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    entry_id = book.id
    {:ok, _book} = Books.delete_book(book)

    UserBookController.delete(conn,  %{"id" => entry_id})

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end

  def request_from_user(conn, %{"id" => id}) do
    conn
    |> put_flash(:info, "works.")
  end
end
