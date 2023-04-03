local M = {}

local icons = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

function M.setup(config)
  -- local navic = require("nvim-navic")
  require("neodev").setup()

  for server, server_config in pairs(config) do
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities = vim.lsp.protocol.make_client_capabilities()
    
    lspconfig[server].setup({
      capabilities = capabilities,
      settings = server_config,
      -- on_attach = function(client, bufnr)
      --   navic.attach(client, bufnr)
      -- end
    })

    for name, icon in pairs(icons) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
  end
end

return M
