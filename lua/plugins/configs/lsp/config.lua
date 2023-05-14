local lspconfig = require("lspconfig")

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

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lspconfig.lua_ls.setup({
  capabilities = capabilities,

  settings = require("plugins.configs.lsp.servers.lua_ls"),
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})
