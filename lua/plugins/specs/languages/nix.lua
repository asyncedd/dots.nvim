return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    config = function()
      require("lspconfig").nil_ls.setup({
        capabilities = require("plugins.configs.lsp.config").capabilities,
        settings = { ["nil"] = {} },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, {
        "nix",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        nix = { "alejandra" },
      },
    },
  },
  {
    "LnL7/vim-nix",
    ft = {
      "nix",
    },
  },
}
