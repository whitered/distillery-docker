defmodule Dockertest.Worker do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def add(x), do: Agent.update(__MODULE__, fn state -> [x | state] end)

  def get, do: Agent.get(__MODULE__, &(&1))
end
