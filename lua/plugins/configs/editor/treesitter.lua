local mocha = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "@variable", { fg = mocha.pink })

require("nvim-treesitter.configs").setup({
  -- Ensure both markdown and markdown_inline is installed.
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "luap",
    "lua",
  },

  -- Automagically install parsers when needed.
  auto_install = true,

  -- Enable treesitter's highlighting.
  highlight = {
    enable = true,
    -- use_language_tree = true,
  },
})
