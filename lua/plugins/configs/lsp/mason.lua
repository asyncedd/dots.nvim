require("mason").setup()

require("mason-null-ls").setup({
  ensure_installed = {
    "stylua",
    "luacheck",
    "prettierd",
    "eslint_d",
    "jq",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "marksman",
    "astro",
    "tsserver",
    "jsonls",
    "emmet_ls",
    "yamlls",
  },
})
