return not dots.filetypes.markdown and {}
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
    {
      "lukas-reineke/headlines.nvim",
      opts = {},
      ft = "markdown",
      enabled = dots.filetypes.markdown.headlines,
    },
  }
