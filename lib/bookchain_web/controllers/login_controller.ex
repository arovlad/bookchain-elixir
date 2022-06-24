defmodule BookchainWeb.LoginController do
  use BookchainWeb, :controller

  alias Bookchain.Users
  alias Bookchain.Users.User

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
