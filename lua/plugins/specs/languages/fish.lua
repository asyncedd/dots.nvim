return _G.config.filetypes.fish and {}
  or {
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          fish = {},
          fish_indent = {},
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "fish" },
      },
    },
  }
