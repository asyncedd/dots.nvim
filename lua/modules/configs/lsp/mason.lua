local lsp_config = require("modules.configs.lsp.lsp_config")

return function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "pyright", "astro" }
  })

  lsp_config.setup({
    lua_ls = require("modules.configs.lsp.servers.null_ls")
  })

end
