local M = {}

M.setup = function()
  require("core.options")
  vim.cmd.colorscheme "habamax"
  vim.defer_fn(function ()
    -- simulate some heavy plugin loading
    require("core.lazy")
    require("mappings.movement")
  end, 0)

end

return M
