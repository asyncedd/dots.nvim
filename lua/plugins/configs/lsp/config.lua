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

capabilities.textDocument = {
  inlayHint = true,
}

lspconfig.lua_ls.setup({
  capabilities = capabilities,

  settings = require("plugins.configs.lsp.servers.lua_ls"),
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,

  settings = require("plugins.configs.lsp.servers.rust-analyzer"),
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,

  settings = require("plugins.configs.lsp.servers.jsonls"),
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
})
