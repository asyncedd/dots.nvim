local M = {}

local icons = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

function M.setup(config)
  for server, server_config in pairs(config) do
    local lspconfig = require('lspconfig')
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig[server].setup({
      capabilities = capabilities,
      server_config
    })

    for name, icon in pairs(icons) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
  end
end

return M
