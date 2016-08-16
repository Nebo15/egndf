defmodule EgndfTest do
  use ExUnit.Case
  doctest Egndf

  test "make decision" do
    a = Egndf.decision_make("57b2c934ce3c0c04f5688f3a", %{is_set: 123, second: "string"})
    IO.inspect a
  end
end
