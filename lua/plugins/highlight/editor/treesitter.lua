local colors = require("catppuccin.palettes").get_palette()

require("catppuccin.lib.highlighter").syntax({
  ["@variable"] = { fg = colors.flamingo },
})
