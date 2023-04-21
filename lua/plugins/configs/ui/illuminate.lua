local mocha = require("catppuccin.palettes").get_palette("mocha")

local M = {}

local hex_to_rgb = function(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local red, green, blue = string.match(hex_str, pat)
  return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

function M.blend(fg, bg, alpha)
  bg = hex_to_rgb(bg)
  fg = hex_to_rgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or M.bg, math.abs(amount))
end

local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette
require("catppuccin.lib.highlighter").syntax({
  IlluminatedWordText = { bg = M.darken(colors.surface1, 0.7, colors.base) },
  IlluminatedWordRead = { bg = M.darken(colors.surface1, 0.7, colors.base) },
  IlluminatedWordWrite = { bg = M.darken(colors.surface1, 0.7, colors.base) },
})

require("illuminate").configure({
  delay = 30,
  providers = {
    -- Prioritize treesitter over LSP since, LSP DOES take some time to starup.
    "treesitter",
    "regex",
    "lsp",
  },
})
