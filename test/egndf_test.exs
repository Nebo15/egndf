defmodule EgndfTest do
  use ExUnit.Case
  doctest Egndf

  test "make decision" do
    a = Egndf.decision_make("57b239a84e5014160879b4da", %{is_set: 123, second: "string"})
    IO.inspect a
  end
end
