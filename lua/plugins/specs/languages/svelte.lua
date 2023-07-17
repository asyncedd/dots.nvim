return dots.languages.svelte ~= true and {}
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
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "fivethree-team/vscode-svelte-snippets",
      },
    },
    {
      "CKolkey/ts-node-action",
      opts = function(_, opts)
        opts.svelte = {
          ["attribute_value"] = require("ts-node-action.actions").conceal_string(),
        }
      end,
    },
    {
      "mfussenegger/nvim-dap",
      opts = {
        adapters = {
          "js-debug-adapter",
        },
      },
    },
  }
