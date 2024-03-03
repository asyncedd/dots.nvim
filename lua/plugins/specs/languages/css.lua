return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        cssls = {
          cmd = { "css-languageserver", "--stdio" },
        },
      },
    },
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
