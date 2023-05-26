local M = {}

local hipatterns = require("mini.hipatterns")
local hex_color = hipatterns.gen_highlighter.hex_color({ priority = 5000 })

-- These are some colors for Tailwind CSS
--
-- CREDIT: LazyVim.
-- https://tailwindcss.com/docs/customizing-colors
M.colors = require("plugins.configs.ui.hipatterns.tailwind")

-- A list of Filetypes to enable Tailwind CSS colors
--
-- Otherwise, they'll be useless
local tailwind_ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" }

return {
  highlighters = {
    -- Hex color is Hex color
    hex_color = hex_color,
    tailwind = {
      pattern = function()
        if not vim.tbl_contains(tailwind_ft, vim.bo.filetype) then
          return
        end
        return "%f[%w:-]()[%w:-]+%-[a-z%-]+%-%d+()%f[^%w:-]"
      end,
      group = function(_, match)
        local color, shade = match:match("[%w-]+%-([a-z%-]+)%-(%d+)")
        local hex = vim.tbl_get(M.colors, color, tonumber(shade))
        if hex then
          return hex_color.group(nil, nil, { full_match = "#" .. hex })
        end
      end,
    }
  },
}

-- TEST:
-- #ffffff
