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

ui["rebelot/heirline.nvim"] = {
  event = "BufReadPost",
  config = require("ui.heirline")
}

return ui
