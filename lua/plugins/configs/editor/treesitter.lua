require("nvim-treesitter.configs").setup({

  -- Make sure we've installed:
  ensure_installed = { "markdown", "markdown_inline" },

  -- Auto-install mssing parsers
  auto_install = true,

  -- Enable highlighting.
  highlight = {
    enable = true,
    use_languagetree = true,
  },
})

vim.g.matchup_matchparen_offscreen = { method = "popup" }
