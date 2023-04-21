local vim = vim -- Avoid expensive global searching.
local o = vim.api.nvim_set_option_value

local M = {}

M.setup = function()
  vim.g.mapleader = " "
  o("number", true, {}) -- Enable Line numbers
  o("cursorline", true, {})
  o("list", true, {})
  o("listchars", "eol:↴,space:⋅", {})
  o("termguicolors", true, {})

  require("core.lazy")
  require("core.pluginLoader.ui_plugins")
  vim.schedule(function()
    require("core.options")
    require("mappings.movement")
  end)
  vim.defer_fn(function ()
    require("core.pluginLoader.other_plugins")
  end, 0)

end

return M
