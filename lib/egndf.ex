defmodule Egndf do
  @moduledoc """
    Provides API interfaces
    Documentation: http://docs.gandalf4.apiary.io/#
  """
  defdelegate decision_make(id, values), to: Egndf.Api.Decisions, as: :make
end
