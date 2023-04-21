-- Set some colorschemes.
-- You can provide a colorscheme table to pass to Lazy.nvim.
-- You can see an example here!

local M = {
  {
    "catppuccin/nvim",
    config = require("plugins.configs.ui.catppuccin"),
    priority = 1000,
    lazy = false,
  },
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
}

return M
