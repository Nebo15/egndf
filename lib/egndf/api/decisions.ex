defmodule Egndf.Api.Decisions do
  @moduledoc """
    Provides Decisions API interfaces
    Documentation: http://docs.gandalf4.apiary.io/#reference/decision
  """

  import Egndf.Api.Base

  def make(id, values) when is_binary(id) and is_map(values) do
    send_post values, "tables/" <> id <> "/decisions"
  end

  def make(_, _) do
    {:error, "param id must be a string and param values must be a map"}
  end

  def get_by_id(id) when is_binary(id) do
    send_get "decisions/" <> id
  end

  def get_by_id(_) do
    {:error, "param id must be a string"}
  end
end
