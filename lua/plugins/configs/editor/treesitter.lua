require("nvim-treesitter.configs").setup({
  -- Automagically install parsers when needed.
  auto_install = true,

  -- Enable treesitter's highlighting.
  highlight = {
    enable = true,
    -- use_language_tree = true,
  },

  matchup = {
    enable = true,
  },
})

local g = vim.g

g.matchup_matchparen_deferred = 1
g.matchup_matchparen_offscreen = { method = "none" }
