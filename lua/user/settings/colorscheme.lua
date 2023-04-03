-- Set some colorschemes.
-- You can provide a colorscheme table to pass to Lazy.nvim.
-- You can see an example here!

local colorscheme = require("user.settings").colorscheme

local M = {
  -- Catppuccin - A truly vibrant and beautiful colorscheme.
  {
    "catppuccin/nvim",
    config = require("plugins.configs.ui.catppuccin"),
    lazy = function()
      if "catppuccin" == colorscheme then
        return false
      end
    end,
  },
  -- Tokyonight.nvim - the colorschemes for people surrounded in RGB.
  {
    "folke/tokyonight.nvim",
    config = require("plugins.configs.ui.tokyonight"),
    -- Change "lazy = true" to lazy = false" if you want to have Tokyonight.nvim instead of catppuccin.
    -- BTW if you use another colorscheme that isn't catppuccin, you might want to tweak some of the heirline's config.
    -- (Hint: nvim lua/configs/ui/heirline/colors.lua)
    -- If you get an error about "gitDiff not found" or something,
    -- Change it to "gitDeleted" ig.
    lazy = function()
      if "tokyonight" == colorscheme then
        return false
      end
    end,
    -- This ^^^
  },
  -- Kanagawa.nvim - A beautiful colorscheme.
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = function()
      if "kanagawa" == colorscheme then
        return false
      end
    end,
    config = function()
      require("plugins.configs.ui.kanagawa")
    end,
  },
  -- -- Edge.nvim
  -- {
  --   "sainnhe/edge",
  --   config = require("plugins.configs.ui.edge"),
  --   lazy = true,
  -- }
  -- Dropped support for edge.nvim since it has been a pain to use it with Heirline.
}

return M
