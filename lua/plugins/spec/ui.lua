local M = {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    config = require("plugins.configs.ui.indent"),
  },
  {
    "monkoose/matchparen.nvim",
    event = "BufReadPost",
    config = require("plugins.configs.ui.matcher"),
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = true,
  },
  {
    "rebelot/heirline.nvim",
    event = "BufReadPost",
    config = require("plugins.configs.ui.heirline"),
  },
}

return M
