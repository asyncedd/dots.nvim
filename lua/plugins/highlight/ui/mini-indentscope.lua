local colors = require("catppuccin.palettes").get_palette()

require("catppuccin.lib.highlighter").syntax({
  MiniIndentscopeSymbol = { fg = colors.text },
  MiniIndentscopePrefix = { style = { "nocombine" } }, -- Make it invisible
})
