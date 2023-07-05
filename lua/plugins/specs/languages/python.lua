return not _G.config.filetypes.python == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          ruff_lsp = {},
        },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          isort = {},
          black = {
            with = {
              args = {
                "--fast",
                "--quiet",
                "--stdin-filename",
                "$FILENAME",
                "-",
              },
            },
          },
          mypy = {},
          flake8 = {},
        },
      },
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        local python_env = function()
          for _, client in pairs(vim.lsp.get_active_clients()) do
            if client.name == "pyright" then
              return client.config.settings.python
            end
          end
          return nil
        end

        local dap_py = require("dap-python")
        dap_py.resolve_python = function()
          local env = python_env()
          if env then
            return env.pythonPath
          else
            return "python"
          end
        end
        dap_py.setup()
      end,
      dependencies = "nvim-dap",
      init = function()
        vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
          callback = function()
            if vim.bo.filetype == "python" then
              vim.schedule(function()
                require("lazy").load({ plugins = "nvim-dap-python" })
              end)
            end
          end,
        })
      end,
    },
  }
