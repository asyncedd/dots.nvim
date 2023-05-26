local M = {}

local hipatterns = require("mini.hipatterns")
local hex_color = hipatterns.gen_highlighter.hex_color({ priority = 5000 })

-- These are some colors for Tailwind CSS
--
-- CREDIT: LazyVim.
-- https://tailwindcss.com/docs/customizing-colors

-- A list of Filetypes to enable Tailwind CSS colors
--
-- Otherwise, they'll be useless

return {
  highlighters = {
    -- Hex color is Hex color
    hex_color = hex_color,
    word_color = { pattern = "%S+", group = require("plugins.configs.ui.hipatterns.words") },
    tailwind = {
      pattern = require("plugins.configs.ui.hipatterns.tailwind").pattern,
      group = require("plugins.configs.ui.hipatterns.tailwind").group,
    },
  },
}

-- TEST:
-- #ffffff
