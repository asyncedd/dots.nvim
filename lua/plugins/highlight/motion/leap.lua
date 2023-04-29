local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette

require("catppuccin.lib.highlighter").syntax({
  LeapBackdrop = { link = "Comment" },
  LeapMatch = { fg = colors.text, style = { "bold", "nocombine" } },
  LeapLabelPrimary = { fg = colors.pink, style = { "bold", "nocombine" } },
  LeapLabelSecondary = { fg = colors.sky, style = { "bold", "nocombine" } },
})
