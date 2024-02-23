return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        marksman = {},
      },
    },
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
