%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/"],
        excluded: []
      },
      checks: [
        {Credo.Check.Design.AliasUsage, priority: :low},
        {Credo.Check.Design.DuplicatedCode, excluded_macros: []},
        {Credo.Check.Design.TagTODO, exit_status: 2},
        {Credo.Check.Readability.MaxLineLength, priority: :low, max_length: 120},
        {Credo.Check.Refactor.PipeChainStart, priority: :low},
      ]
    }
  ]
}
