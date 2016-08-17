defmodule EgndfTest do
  use ExUnit.Case
  doctest Egndf

  @table_id "57839fc6e79e85188b738860"

  test "make decision" do
    decision = Egndf.decision_make(@table_id, %{number: 123, string: "string"})
    assert_meta_200 decision
    assert_decision decision

    {:ok, decision} = decision
    resp = Egndf.decision_get(decision["data"]["_id"])
    assert_meta_200 resp
    assert_decision resp
  end

  def assert_decision({:ok, data = %{
    "data" => %{
      "_id" => _,
      "application" => _,
      "title" => _,
      "description" => _,
      "final_decision" => _,
      "request" => _,
      "table" => %{
        "_id" => _,
        "description" => _,
        "matching_type" => _,
        "title" => _,
        "variant" => %{
          "_id" => _,
          "description" => _,
          "title" => _
        }
      },
      "created_at" => _,
      "updated_at" => _
      }
    }}
    ) do
    assert data
  end

  def assert_decision(_) do
    assert false, "invalid decision"
  end

  def assert_meta_200({:ok, %{"meta" => %{"code" => code}}}) do
    assert code == 200
  end

  def assert_meta_200(_) do
    assert false, "invalid meta"
  end
end
