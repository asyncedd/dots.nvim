return not dots.languages.toml.enable and {}
  or {
    not dots.languages.toml.LSP.null.enable and {} or {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = dots.languages.toml.LSP.null.servers,
      },
    },
    not dots.languages.toml.LSP.config.enable and {} or {
      "neovim/nvim-lspconfig",
      opts = {
        servers = dots.languages.toml.LSP.config.servers,
      },
    },
  }
