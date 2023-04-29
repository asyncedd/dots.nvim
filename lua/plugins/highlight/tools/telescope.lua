local colors = require("catppuccin.palettes").get_palette()

require("catppuccin.lib.highlighter").syntax({
  TelescopeSelection = { bg = colors.surface0 },
  TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
  TelescopePromptPrefix = { bg = colors.surface0 },
  TelescopePromptNormal = { bg = colors.surface0 },
  TelescopeResultsNormal = { bg = colors.mantle },
  TelescopePreviewNormal = { bg = colors.crust },
  TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
  TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
  TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
  TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
  TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
  TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
  IndentBlanklineChar = { fg = colors.surface0 },
  IndentBlanklineContextChar = { fg = colors.surface2 },
})
