-- Set some colorschemes.
-- You can provide a colorscheme table to pass to Lazy.nvim.
-- You can see an example here!

local M = {
  {
    "catppuccin/nvim",
    config = require("plugins.configs.ui.catppuccin"),
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
  },
}

return M
