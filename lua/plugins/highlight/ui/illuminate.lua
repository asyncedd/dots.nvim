local C = require("catppuccin.palettes").get_palette()
local U = require("catppuccin.utils.colors")

require("catppuccin.lib.highlighter").syntax({
  IlluminatedWordText = { bg = U.darken(C.surface1, 0.7, C.base) },
  IlluminatedWordRead = { bg = U.darken(C.surface1, 0.7, C.base) },
  IlluminatedWordWrite = { bg = U.darken(C.surface1, 0.7, C.base) },
})
