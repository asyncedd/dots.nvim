return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        ["nil_ls"] = {
          ["nil"] = {},
        },
      },
    },
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
}
