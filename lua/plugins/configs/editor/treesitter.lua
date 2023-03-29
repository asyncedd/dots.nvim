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

  -- Enable rainbow parentheses.
  rainbow = {
    enable = true,
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
})

