require("illuminate").configure({
  delay = 30,
  providers = {
    -- Prioritize treesitter over LSP since, LSP DOES take some time to starup.
    "treesitter",
    "regex",
    "lsp",
  },
})
