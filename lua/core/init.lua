local M = {}

M.setup = function()
  -- Set the options for Neovim.
  require("core.options")
  require("core.lazy")

  require("impatient")

  -- Set some mappings for Neovim.
  require("mappings")
  require("core.autocmds")

  local colorscheme = require("core.settings").colorscheme

  vim.api.nvim_command("colorscheme " .. colorscheme)
end

return M
