local M = {}

M.setup = function()
  require("core.options")
  require("mappings.movement")
  require("core.lazy")

  vim.api.nvim_command("colorscheme catppuccin")
end

return M
