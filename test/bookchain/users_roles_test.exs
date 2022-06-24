defmodule Bookchain.UsersRolesTest do
  use Bookchain.DataCase

  alias Bookchain.UsersRoles

  describe "users_roles" do
    alias Bookchain.UsersRoles.UserRole

    @valid_attrs %{role: 42, user: 42}
    @update_attrs %{role: 43, user: 43}
    @invalid_attrs %{role: nil, user: nil}

    def user_role_fixture(attrs \\ %{}) do
      {:ok, user_role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UsersRoles.create_user_role()

      user_role
    end

    test "list_users_roles/0 returns all users_roles" do
      user_role = user_role_fixture()
      assert UsersRoles.list_users_roles() == [user_role]
    end

    test "get_user_role!/1 returns the user_role with given id" do
      user_role = user_role_fixture()
      assert UsersRoles.get_user_role!(user_role.id) == user_role
    end

    test "create_user_role/1 with valid data creates a user_role" do
      assert {:ok, %UserRole{} = user_role} = UsersRoles.create_user_role(@valid_attrs)
      assert user_role.role == 42
      assert user_role.user == 42
    end

    test "create_user_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UsersRoles.create_user_role(@invalid_attrs)
    end

    test "update_user_role/2 with valid data updates the user_role" do
      user_role = user_role_fixture()
      assert {:ok, %UserRole{} = user_role} = UsersRoles.update_user_role(user_role, @update_attrs)
      assert user_role.role == 43
      assert user_role.user == 43
    end

    test "update_user_role/2 with invalid data returns error changeset" do
      user_role = user_role_fixture()
      assert {:error, %Ecto.Changeset{}} = UsersRoles.update_user_role(user_role, @invalid_attrs)
      assert user_role == UsersRoles.get_user_role!(user_role.id)
    end

    test "delete_user_role/1 deletes the user_role" do
      user_role = user_role_fixture()
      assert {:ok, %UserRole{}} = UsersRoles.delete_user_role(user_role)
      assert_raise Ecto.NoResultsError, fn -> UsersRoles.get_user_role!(user_role.id) end
    end

    test "change_user_role/1 returns a user_role changeset" do
      user_role = user_role_fixture()
      assert %Ecto.Changeset{} = UsersRoles.change_user_role(user_role)
    end
  end
end
