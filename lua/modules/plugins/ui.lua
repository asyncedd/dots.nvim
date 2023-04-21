local ui = {}

table.insert(ui, {
  "catppuccin/nvim",
  name = "catppuccin",
  config = require("modules.configs.ui.catppuccin")
})

table.insert(ui, {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  config = require("modules.configs.ui.indent_blankline")
})

table.insert(ui, {
  "echasnovski/mini.indentscope",
  event = "BufReadPost",
  config = require("modules.configs.ui.indentscope")
})

return ui
