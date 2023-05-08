local colors = require("catppuccin.palettes").get_palette()
local utils = require("catppuccin.utils.colors")
local tint = function(tint)
  return utils.blend(tint, colors.base, 0.7)
end

require("catppuccin.lib.highlighter").syntax({
  MiniIndentscopeSymbol = { fg = tint(colors.sky) },
})
