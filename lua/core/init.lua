local M = {}

M.setup = function()
  -- Set the options for Neovim.
  require("core.options")
  -- Set some mappings for Neovim.
  require("core.keymaps")
  require("core.lazy")
end

return M
