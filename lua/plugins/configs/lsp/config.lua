-- lua/plugins/configs/lsp/config.lua - Get it? lsp/config.lua? I'm so boring :(

return function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }

  local lspconfig = require("lspconfig")

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = require("plugins.configs.lsp.servers.lua_ls")
  })

end
