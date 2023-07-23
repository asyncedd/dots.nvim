local Rust = dots.languages.rust

return not Rust.enabled and {}
  or {
    not Rust.LSP.config.enable and {} or {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          rust_analyzer = {},
        },
      },
    },
  }
