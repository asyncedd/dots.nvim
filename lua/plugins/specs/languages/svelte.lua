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
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        svelte = { { "prettierd", "prettier" } },
      },
    },
  },
}
