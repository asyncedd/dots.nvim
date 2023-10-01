return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        cssls = {},
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
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
      },
    },
  },
}
