local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette

require("catppuccin.lib.highlighter").syntax({
  -- { "@variable", { fg = colors.red } },
  ["@variable"] = { fg = colors.red, style = { "italic" } },
  -- ["@field"] = { fg = colors.lavender },
  -- ["@property"] = { fg = colors.yellow },
  ["@variable.builtin"] = { fg = colors.maroon, style = { "italic" } },
  -- ["@punctuation.bracket"] = { fg = colors.maroon },
  -- ["@enum"] = { link = "@type" },
  -- ["@text"] = { fg = colors.text },
})
