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
    config = function()
      require("lspconfig").svelte.setup({ capabilities = require("plugins.configs.lsp.config").capabilities })
      require("lspconfig").emmet_ls.setup({ capabilities = require("plugins.configs.lsp.config").capabilities })
      require("lspconfig").tailwindcss.setup({ capabilities = require("plugins.configs.lsp.config").capabilities })
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
