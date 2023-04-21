local M = {}

M.setup = function()
  -- Set the options for Neovim.
  require("core.options")
  require("core.lazy")

  -- Set some mappings for Neovim.
  local colorscheme = require("core.settings").colorscheme

  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function ()
      require("mappings")
      require("core.autocmds")

    end
  })


  vim.api.nvim_command("colorscheme " .. colorscheme)
  -- require(colorscheme).load()
end

return M
