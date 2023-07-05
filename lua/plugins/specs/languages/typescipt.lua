return not _G.config.filetypes.typescript == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers_to_not_setup = {
          "tsserver",
        },
        servers = {
          tsserver = {},
        },
      },
    },
    {
      "pmizio/typescript-tools.nvim",
      opts = function()
        return {
          on_attach = require("plugins.configs.lsp.config").on_attach,
        }
      end,
      init = function()
        vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
          callback = function()
            local std = require("std")
            local ft = vim.bo.filetype
            if
              std.exists_in_array({
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
              }, ft)
            then
              vim.schedule(function()
                require("lazy").load({ plugins = "typescript-tools.nvim" })
                vim.cmd("silent! do FileType")
              end)
            end
          end,
        })
      end,
    },
    {},
  }
