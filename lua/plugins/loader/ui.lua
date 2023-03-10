-- Load the colorscheme and Treesitter first.
require("plugins.configs.ui.catppuccin")
require("plugins.configs.editor.treesitter")

vim.defer_fn(function ()
  -- Load indent-blankline and NvChad/Colorizer.nvim later.
  -- Also pretty-fold and mini.cursorword
  vim.defer_fn(function ()
    require("indent_blankline").setup({
      show_end_of_line = true,
      space_char_blankline = " ",
      enabled = true,
      colored_indent_levels = false,
      show_trailing_blankline_indent = true,
    })
    require("colorizer").setup({})
    require("pretty-fold").setup({})
    require("mini.cursorword").setup({
      delay = 50
    })
    require("mini.cursorword").setup({
      symbol = "│",
      options = { try_as_border = true },
    })
  end, 25)

  vim.defer_fn(function ()
    -- I love heirline.nvim so it can load faster. (What is the logic behind this?)
    require("plugins.configs.ui.heirline")
  end, 15)
end, 75)
