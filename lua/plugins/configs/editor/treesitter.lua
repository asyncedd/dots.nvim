require("nvim-treesitter.configs").setup({
  -- Ensure both markdown and markdown_inline is installed.
  ensure_installed = {
    "markdown",
    "markdown_inline",
  },

  -- Automagically install parsers when needed.
  auto_install = true,

  -- Enable treesitter's highlighting.
  highlight = {
    enable = true,
    -- use_language_tree = true,
  },

  -- Have Vim-matchup!
  matchup = {
    enable = true,
  },

  -- Treesitter powered indents.
  indent = {
    enable = true,
  },
})

local g = vim.g

g.matchup_matchparen_deferred = 1
g.matchup_matchparen_offscreen = { method = "none" }
