local go = dots.languages.go

return not go.enable and {}
  or {
    not go.LSP.config.enable and {} or {
      "neovim/nvim-lspconfig",
      opts = {
        servers = go.LSP.config.servers or {},
      },
    },
    not go.LSP.null.enable and {} or {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = go.LSP.null.sources or {},
      },
    },
  }
