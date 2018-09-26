defmodule DockertestTest do
  use ExUnit.Case
  doctest Dockertest

  test "greets the world" do
    assert Dockertest.hello() == :world
  end
end
