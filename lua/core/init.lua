local vim = vim -- Avoid expensive global searching.
local o = vim.api.nvim_set_option_value

local M = {}

M.setup = function()
  vim.g.mapleader = " "
  o("number", true, {}) -- Enable Line numbers
  o("cursorline", true, {})
  o("list", true, {})
  o("listchars", "eol:↴,space:⋅", {})

  require("core.lazy")
  require("core.pluginLoader.ui_plugins")
  vim.defer_fn(function ()
    require("core.options")
    -- simulate some heavy plugin loading
    require("mappings.movement")
    require("core.pluginLoader.other_plugins")
  end, 0)

end

return M
