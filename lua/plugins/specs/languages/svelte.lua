return not _G.config.filetypes.svelte == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          svelte = {
            settings = {
              svelte = {
                plugin = {
                  css = {
                    diagnostics = {
                      enable = false,
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "svelte", "typescript", "javascript", "css", "scss" },
      },
    },
  }
