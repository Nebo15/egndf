defmodule Egndf do
  @moduledoc """
  This module provides API helpers for Gandalf Decision Engine.
  Documentation: http://docs.gandalf4.apiary.io/#
  """

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
