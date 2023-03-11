-- lua/plugins/loader/ui.lua
-- Where we load our eye-candy.

-- Avoid expensive global searching, we already have it at home!
local cats_in_line = vim.schedule

-- Load the colorscheme and Treesitter first.
-- We love catppuccin, catppuccin is life.

require("plugins.configs.ui.catppuccin")
-- Nvim.treesitter makes our highlighting beautiful.

vim.defer_fn(function()
  require("plugins.configs.editor.treesitter")
end, 0)

-- These are the options for mini.indentscope.
local indentscope_opts = {
  -- We set the current-indent-scope visualizer symbol for a clean, onliner.
  symbol = "│",
  -- We also enable try_as_border.
  options = { try_as_border = true },
}

cats_in_line(function ()

  -- Load indent_blankline and mini.indentscope for a clean and, aesthestically pleasing indent visualizer.
  require("indent_blankline").setup()

  require("mini.indentscope").setup(indentscope_opts)

  -- Colorizer is a beautiful color-code visualizer that is blazingly fast, if the Primeagen were to say it.
  require("colorizer").setup({})

  -- CCCC.nvim is a powerful color picker for those that are picky! (me)
  require("ccc").setup()

  -- Pretty-fold.nvim is a clean and cute, aesthetically pleasing alternative to the ugly builtin visualizer.

  require("pretty-fold").setup({})

  -- Mini.cursorword which visualizes the current word under the cursor.

  require("mini.cursorword").setup({})

end)

cats_in_line(function ()

  -- Heirline.nvim is a true minimalisitc statusline for Neovim.

  require("plugins.configs.ui.heirline")

end)
