-- lua/plugins/configs/lsp/config.lua - Get it? lsp/config.lua? I'm so boring :(

require("neodev").setup({
  library = {
    plugins = {
      "nvim-dap-ui",
    },
    types = true
  },
})

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
local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach(require("lsp_signature").setup(), bufnr)  -- Note: add in lsp client on-attach
  require("nvim-navbuddy").attach(client, bufnr)
  vim.keymap.set("n", "<leader>nb", function() require("nvim-navbuddy").open() end, {})
end

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("plugins.configs.lsp.servers.lua_ls")
})

lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

