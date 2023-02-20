local ui = {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = require("ui.catppuccin"),
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    config = require("ui.indent_blankline"),
  },

  {
    "echasnovski/mini.indentscope",
    event = "BufReadPost",
    config = require("ui.indentscope"),
  },

  {
    "rebelot/heirline.nvim",
    event = "BufReadPost",
    config = require("ui.heirline"),
    dependencies = {
      {"nvim-tree/nvim-web-devicons"}
    }
  },

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    config = require("ui.dashboard")
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = require("ui.colorizer")
  },

  {
    "rebelot/kanagawa.nvim"
  },
  {
    "ellisonleao/gruvbox.nvim"
  },
  {
    "folke/tokyonight.nvim"
  },
  {
    "EdenEast/nightfox.nvim"
  },
}

return ui
