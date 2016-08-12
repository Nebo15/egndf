defmodule Egndf do

  defdelegate decision_make(id, values), to: Egndf.Api.Decisions, as: :make
end
