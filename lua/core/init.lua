local M = {}

M.setup = function()
  require("core.options")
  require("core.lazy")
  require("core.load_ui_plugins")
  vim.defer_fn(function ()
    -- simulate some heavy plugin loading
    require("mappings.movement")
  end, 0)

end

return M
