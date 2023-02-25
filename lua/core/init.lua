local M = {}

M.setup = function()
  require("core.options")
  vim.defer_fn(function ()
    -- simulate some heavy plugin loading
    require("core.lazy")
    require("mappings.movement")
  end, 50)

end

return M
