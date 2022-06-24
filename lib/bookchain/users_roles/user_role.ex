defmodule Bookchain.UsersRoles.UserRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_roles" do
    field :role, :integer
    field :user, :integer

    timestamps()
  end

  @doc false
  def changeset(user_role, attrs) do
    user_role
    |> cast(attrs, [:user, :role])
    |> validate_required([:user, :role])
  end
end
