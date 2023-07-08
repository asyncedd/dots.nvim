return dots.filetypes.svelte ~= true and {}
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
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "svelte", "typescript", "javascript", "css", "scss" })
        end
      end,
    },
  }
