local M = {}

M.setup = function()
  -- Set the options for Neovim.
  require("core.options")
  -- Set some mappings for Neovim.
  require("core.keymaps")
  require("core.lazy")

  local colorscheme = require("core.settings").colorscheme

  vim.api.nvim_command("colorscheme " .. colorscheme)
end

return M
