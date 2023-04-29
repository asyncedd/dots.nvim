local colors = require("catppuccin.palettes").get_palette()

require("catppuccin.lib.highlighter").syntax({
  MiniStarterCurrent = {},
  MiniStarterFooter = { fg = colors.yellow, style = { "italic" } },
  MiniStarterHeader = { fg = colors.blue },
  MiniStarterInactive = { fg = colors.surface2, style = { "italic" } },
  MiniStarterItem = { fg = colors.text },
  MiniStarterItemBullet = { fg = colors.blue },
  MiniStarterItemPrefix = { fg = colors.pink },
  MiniStarterSection = { fg = colors.flamingo },
  MiniStarterQuery = { fg = colors.green },
})
