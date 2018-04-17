defmodule Rumbl.UserRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.User

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      name: "Some User",
      username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
      password: "supersecret",
      }, attrs)

      %Rumbl.User{}
      |> Rumbl.User.registration_changeset(changes)
      |> Repo.insert!()
    end

    @valid_attrs %{name: "A User", username: "eva"}

    test "converts unique_constraint on username to error" do
      insert_user(username: "eric")
      attrs = Map.put(@valid_attrs, :username, "eric")
      changeset = User.changeset(%User{}, attrs)

      assert {:error, changeset} = Repo.insert(changeset)
      assert {:username, "has already been taken"} in changeset.errors
    end
  end
