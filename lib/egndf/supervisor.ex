defmodule Egndf.Supervisor do
  @moduledoc """
    Supervisor for OTP
    Documentation: http://elixir-lang.org/docs/stable/elixir/Supervisor.html
  """
  use Supervisor

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = []
    supervise(children, strategy: :one_for_one)
  end
end
