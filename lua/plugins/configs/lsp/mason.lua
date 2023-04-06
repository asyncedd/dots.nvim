require("mason").setup()

require("mason-null-ls").setup({
  ensure_installed = {
    "stylua",
    "luacheck",
    "prettierd",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "marksman",
    "astro",
    "tsserver",
    "jsonls",
  },
})
