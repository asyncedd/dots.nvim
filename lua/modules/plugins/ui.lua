local ui = {}

table.insert(ui, {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  config = require("modules.configs.ui.catppuccin")
})

return ui
