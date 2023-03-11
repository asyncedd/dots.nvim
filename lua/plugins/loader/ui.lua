-- Load the colorscheme and Treesitter first.
-- We love catppuccin, catppuccin is life.
require("plugins.configs.ui.catppuccin")
-- Nvim.treesitter makes our highlighting beautiful.
require("plugins.configs.editor.treesitter")

-- These are the options for mini.indentscope.
local indentscope_opts = {
  -- We set the current-indent-scope visualizer symbol for a clean, onliner.
  symbol = "│",
  -- We also enable try_as_border.
  options = { try_as_border = true },
}

vim.schedule(function ()
  -- Load indent_blankline and mini.indentscope.
  -- Indent_blankline is indent-line visualizer.
  -- Mini.indentscope is a current-indent-line visualizer.
  require("indent_blankline").setup()
  require("mini.indentscope").setup(indentscope_opts)
  -- NvChad/Colorizer.nvim is a modern maintained fork of the original colorizer.
  -- It visualizes what color a color code is.
  -- It's blazingly fast.
  -- TODO Add CCC.nvim
  require("colorizer").setup({})
  -- Pretty-fold.nvim is a clean aesthetically pleasing alternative to the ugly builtin visualizer.
  -- It's quite clean!
  require("pretty-fold").setup({})
  -- Mini.cursorword which visualizes the current word under the cursor.
  -- We can easily find where the occurnace of it is located!
  require("mini.cursorword").setup({})
end)

vim.schedule(function ()
  -- I love heirline.nvim so it can load faster. (What is the logic behind this?)
  -- Heirline.nvim is a true minimalisitc statusline for Neovim.
  require("plugins.configs.ui.heirline")
end)
