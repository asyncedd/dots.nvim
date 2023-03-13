-- Some "init" stuff.

-- Initalize LSPSaga options
local lspsaga_opts = {
  ui = {
    theme = 'round',
    title = true,
    -- border type can be single,double,rounded,solid,shadow.
    border = 'rounded',
    winblend = 0,
  }
}

local setup_lsp_based_plugins = function ()
  vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function ()
      require("plugins.configs.lsp.lspconfig")
      require("lspsaga").setup(lspsaga_opts)
    end
  })
end

local M = {}

M.event = "BufReadPost"
M.priority = 1000
M.script = setup_lsp_based_plugins

return M
