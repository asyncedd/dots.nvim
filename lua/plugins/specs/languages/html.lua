local HTML = dots.languages.html

return not HTML.enable and {}
  or {
    not HTML.LSP.config.enable and {} and {
      "neovim/nvim-lspconfig",
      opts = {
        servers = HTML.LSP.config.servers,
      },
    },
  }
