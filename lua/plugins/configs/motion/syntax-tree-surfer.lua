local colors = require("catppuccin.palettes").get_palette()

require("catppuccin.lib.highlighter").syntax({
  STS_hl = { fg = colors.sky },
})

return {
  highlight_group = "STS_hl",
}
