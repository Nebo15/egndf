defmodule EgndfTest do
  use ExUnit.Case
  doctest Egndf

  test "make decision" do
    Egndf.decision_make("57adeaa74e5014e7cd684c3a", %{test_invalid_key: 123})
  end
end
