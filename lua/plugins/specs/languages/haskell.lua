return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    config = function()
      require("lspconfig").hls.setup({
        capabilities = require("plugins.configs.lsp.config").capabilities,
      })
    end,
  },
}
