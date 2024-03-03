return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    config = function()
      require("lspconfig").marksman.setup({
        capabilities = require("plugins.configs.lsp.config").capabilities,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { { "prettierd", "prettier" } },
      },
    },
  },
}
