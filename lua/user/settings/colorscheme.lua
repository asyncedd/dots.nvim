-- Set some colorschemes.
-- You can provide a colorscheme table to pass to Lazy.nvim.
-- You can see an example here!

local M = {
  -- Catppuccin - A truly vibrant and beautiful colorscheme.
  {
    "catppuccin/nvim",
    config = require("plugins.configs.ui.catppuccin"),
    priority = 1000,
    lazy = false,
  },
  -- Tokyonight.nvim - the colorschemes for people surrounded in RGB.
  {
    "folke/tokyonight.nvim",
    config = require("plugins.configs.ui.tokyonight"),
    priority = 1000,
    -- Change "lazy = true" to lazy = false" if you want to have Tokyonight.nvim instead of catppuccin.
    -- BTW if you use another colorscheme that isn't catppuccin, you might want to tweak some of the heirline's config.
    -- (Hint: nvim lua/configs/ui/heirline/colors.lua)
    -- If you get an error about "gitDiff not found" or something,
    -- Change it to "gitDeleted" ig.
    lazy = true,
    -- This ^^^
  },
  -- Edge.nvim
  {
    "sainnhe/edge",
    config = require("plugins.configs.ui.edge"),
    lazy = true,
  }
}

return M
