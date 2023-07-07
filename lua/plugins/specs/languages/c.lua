return not _G.config.filetypes.c == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          clangd = {
            keys = {
              { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            },
            root_dir = function(...)
              -- using a root .clang-format or .clang-tidy file messes up projects, so remove them
              return require("lspconfig.util").root_pattern(
                "compile_commands.json",
                "compile_flags.txt",
                "configure.ac",
                ".git"
              )(...)
            end,
            capabilities = {
              offsetEncoding = { "utf-16" },
            },
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
            },
            init_options = {
              usePlaceholders = true,
              completeUnimported = true,
              clangdFileStatus = true,
            },
          },
          ccls = {},
        },
      },
    },
    {
      "https://git.sr.ht/~p00f/clangd_extensions.nvim",
      opts = function()
        return {
          server = {
            on_attach = require("plugins.configs.lsp.config").on_attach,
          },
          extensions = {
            autoSetHints = false,
          },
        }
      end,
      init = function()
        vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
          callback = function()
            if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
              vim.schedule(function()
                require("lazy").load({ plugins = "clangd_extensions.nvim" })
                vim.cmd("silent! do FileType")
              end)
            end
          end,
        })
      end,
    },
  }
