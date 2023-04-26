local lsp = require("lspconfig")

lsp["lua_ls"].setup({
  settings = require("plugins.configs.lsp.servers.lua_ls"),
})

