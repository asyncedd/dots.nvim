return not (dots.languages.lua or dots.languages.lua.enable) and {}
  or {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        table.insert(opts.ensure_installed, {
          dots.languages.lua.treesitter.base and "lua",
          dots.languages.lua.treesitter.luadoc and "luadoc",
          dots.languages.lua.treesitter.patterns and "luap",
        })
      end,
    },
    dots.languages.lua.LSP.enable and {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                hint = {
                  enable = true,
                  arrayIndex = "Disable",
                },
                runtime = {
                  pathStrict = true,
                },
                completion = {
                  callSnippet = "Both",
                },
                diagnostics = {
                  globals = {
                    "vim",
                  },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                  },
                  maxPreload = 100000,
                  preloadFileSize = 10000,
                  checkThirdParty = false,
                },
              },
            },
          },
        },
      },
      dependencies = dots.languages.lua.LSP.neodev.enable and {
        {
          "folke/neodev.nvim",
          opts = dots.languages.lua.LSP.neodev.opts or {},
        },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          stylua = {
            condition = function(utils)
              return utils.root_has_file({ "stylua.toml" })
            end,
          },
        },
      },
    },
    {
      "mfussenegger/nvim-dap",
      enabled = dots.languages.lua.DAP.enabled,
      dependencies = {
        {
          "jbyuki/one-small-step-for-vimkind",
          -- stylua: ignore
          keys = {
            { "<leader>daL", function() require("osv").launch({ port = 8086 }) end, desc = "Adapter Lua Server" },
            { "<leader>dal", function() require("osv").run_this() end, desc = "Adapter Lua" },
          },
          config = function()
            local dap = require("dap")
            dap.adapters.nlua = function(callback, config)
              callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
            end
            dap.configurations.lua = {
              {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
              },
            }
          end,
        },
      },
    },
  }
