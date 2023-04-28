local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette

require("catppuccin.lib.highlighter").syntax({
  ["@variable"] = { fg = colors.red },
})
