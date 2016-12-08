use Mix.Config
alias Dogma.Rule

config :dogma,
  rule_set: Dogma.RuleSet.All,
  override: [
    %Rule.LineLength{enabled: false},
    %Rule.PipelineStart{enabled: false},
    %Rule.NegatedIfUnless{enabled: false},
  ]
