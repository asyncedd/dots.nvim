return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = function()
          return require("plugins.configs.lsp.mason-lsp")
        end,
        config = true,
      },
    },
    config = true,
  },
}
