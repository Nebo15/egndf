defmodule Egndf do
  @moduledoc """
    Provides API interfaces
    Documentation: http://docs.gandalf4.apiary.io/#
  """
  use Application

  @doc false
  def start(_type, _args) do
    Egndf.Supervisor.start_link
  end

  @doc """
    Make Decision from Table
    Documentation: http://docs.gandalf4.apiary.io/#reference/decision/decisions-make/make
  """
  defdelegate decision_make(id, values), to: Egndf.Api.Decisions, as: :make

  @doc """
    Get Decision by id
    http://docs.gandalf4.apiary.io/#reference/decision/decisions-by-id/get-decision
  """
  defdelegate decision_get(id), to: Egndf.Api.Decisions, as: :get_by_id
end
