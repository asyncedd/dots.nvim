local vim = vim -- Avoid expensive global searching.

local M = {}

M.setup = function()
  vim.g.mapleader = " "
  require("core.lazy")
  require("core.load_ui_plugins")
  vim.defer_fn(function ()
    require("core.options")
    -- simulate some heavy plugin loading
    require("mappings.movement")
  end, 0)

end

return M
