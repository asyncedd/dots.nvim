return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    config = function()
      require("lspconfig").cssls.setup({
        capabilities = require("plugins.configs.lsp.config").capabilities,
        cmd = { "css-languageserver", "--stdio" },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { { "prettierd", "prettier" } },
      },
    },
  },
}
