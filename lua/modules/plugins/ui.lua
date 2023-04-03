local ui = {}

ui["catppuccin/nvim"] = {
  name = "catppuccin",
  config = require("ui.catppuccin")
}

ui["lukas-reineke/indent-blankline.nvim"]= {
  event = "BufReadPost",
  config = require("ui.indent_blankline")
}

ui["echasnovski/mini.indentscope"] = {
  event = "BufReadPost",
  config = require("ui.indentscope")
}

ui["nvim-lualine/lualine.nvim"] = {
  event = "BufReadPost",
  config = require("ui.lualine")
}

return ui
