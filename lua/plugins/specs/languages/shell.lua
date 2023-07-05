return not _G.config.filetypes.shell == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          bashls = {},
        },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          beautysh = {
            extra_args = { "-i", "2" },
          },
        },
      },
    },
    {
      "mfussenegger/nvim-dap",
      opts = {
        adapters = {
          "bash-debug-adapter",
        },
      },
    },
  }
