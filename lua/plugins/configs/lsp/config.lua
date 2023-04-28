local lspconfig = require("lspconfig")

lspconfig["lua_ls"].setup({
  settings = require("plugins.configs.lsp.servers.lua_ls"),
})

vim.cmd("silent! do FileType")
