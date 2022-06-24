defmodule BookchainWeb.SessionController do
  use BookchainWeb, :controller
  alias Bookchain.Users
  alias Bookchain.Users.User

  def new(conn, _params) do
    render(conn, "new.html");
  end

  def create(conn, %{"session" => auth_params}) do
    user = Users.get_by_email(auth_params["email"])
    userPassword = user.password
    authPassword = auth_params["password"]
    case user.password === auth_params["password"] do
      true ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: Routes.book_path(conn, :index))
      false ->
        conn
        |> put_flash(:error, "We have encountered a problem with your email and/or password")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Signed out successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end

end
