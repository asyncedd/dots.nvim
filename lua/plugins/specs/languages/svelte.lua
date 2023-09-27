return {
  {
    "nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.ensure_installed, {
        "svelte",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "rust",
      })
    end,
  },
  {
    "nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        svelte = {},
        emmet_ls = {},
        tailwindcss = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        svelte = { { "prettierd", "prettier" } },
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
