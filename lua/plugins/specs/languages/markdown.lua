return not _G.config.filetypes.markdown == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          marksman = {},
          prosemd_lsp = {},
        },
      },
    },
    {
      "ellisonleao/glow.nvim",
      opts = true,
      cmd = {
        "Glow",
      },
    },
  }
