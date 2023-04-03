local M = {}

M.setup = function()
  require("core.options")
  require("mappings.movement")
  require("core.lazy")
  require("core.runtime")

  vim.api.nvim_command("colorscheme catppuccin")
end

return M
