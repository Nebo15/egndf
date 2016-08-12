defmodule Egndf.Api.Decisions do
  import Egndf.Api.Base

  def make(id, values) when is_binary(id) and is_map(values) do
    post values, "tables/" <> id <> "/decisions"
  end

  def make(_, _) do
    {:error, "param id must be a string and param values must be a map"}
  end
end
