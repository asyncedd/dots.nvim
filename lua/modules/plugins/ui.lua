local ui = {}

ui["catppuccin/nvim"] = {
  name = "catppuccin",
  config = require("ui.catppuccin"),
}

ui["lukas-reineke/indent-blankline.nvim"] = {
  event = "BufReadPost",
  config = require("ui.indent_blankline"),
}

ui["echasnovski/mini.indentscope"] = {
  event = "BufReadPost",
  config = require("ui.indentscope"),
}

ui["rebelot/heirline.nvim"] = {
  event = "BufReadPost",
  config = require("ui.heirline"),
  dependencies = {
    {"nvim-tree/nvim-web-devicons"}
  }
}

ui["glepnir/dashboard-nvim"] = {
  event = "VimEnter",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = require("ui.dashboard")
}

ui["norcalli/nvim-colorizer.lua"] = {
  event = "BufReadPost"
}

ui["rebelot/kanagawa.nvim"] = {}
ui["ellisonleao/gruvbox.nvim"] = {}
ui["folke/tokyonight.nvim"] = {}
ui["EdenEast/nightfox.nvim"] = {}

return ui
