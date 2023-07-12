return dots.languages.rust ~= true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers_to_not_setup = {
          "rust_analyzer",
        },
        servers = {
          rust_analyzer = {},
        },
      },
    },
    {
      "simrat39/rust-tools.nvim",
      opts = function()
        return {
          tools = {
            inlay_hints = {
              auto = false,
              show_parameter_hints = false,
            },
            on_initialized = function()
              vim.cmd([[
                augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
              ]])
            end,
          },
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
          server = {
            on_attach = require("plugins.configs.lsp.config").on_attach,
          },
        }
      end,
      config = function(_, opts)
        require("rust-tools").setup(opts)
        vim.cmd("silent! do FileType")
      end,
      dependencies = {
        "nvim-lspconfig",
        "nvim-dap",
      },
      init = function()
        vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
          callback = function()
            if vim.bo.filetype == "rust" then
              vim.schedule(function()
                require("lazy").load({ plugins = "rust-tools.nvim" })
                vim.cmd("silent! do FileType")
              end)
            end
          end,
        })
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          rustfmt = {},
        },
      },
    },
    {
      "saecki/crates.nvim",
      opts = {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      },
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function(_, opts)
        local crates = require("crates")
        crates.setup(opts)
        crates.show()
      end,
      init = function()
        vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
          pattern = "Cargo.toml",
          callback = function()
            require("lazy").load({ plugins = "crates.nvim" })
            vim.cmd("silent! do FileType")
          end,
        })
      end,
    },
    {
      "nvim-neotest/neotest",
      opts = function()
        return {
          adapters = {
            require("neotest-rust"),
          },
        }
      end,
      dependencies = "rouge8/neotest-rust",
    },
    {
      "mfussenegger/nvim-dap",
      opts = {
        adapters = {
          "codelldb",
        },
      },
    },
  }
