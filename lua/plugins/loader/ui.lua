-- Load the colorscheme and Treesitter first.
require("plugins.configs.ui.catppuccin")
require("plugins.configs.editor.treesitter")

vim.defer_fn(function ()
  -- Load indent-blankline and NvChad/Colorizer.nvim later.
  -- Also pretty-fold and mini.cursorword
  vim.schedule(function ()
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
    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
    })
  end)

  vim.schedule(function ()
    -- I love heirline.nvim so it can load faster. (What is the logic behind this?)
    require("plugins.configs.ui.heirline")
  end)
end, 75)
