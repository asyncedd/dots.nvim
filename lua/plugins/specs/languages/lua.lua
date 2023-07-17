return not (dots.languages.lua or dots.languages.lua.enable) and {} or {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { dots.languages.lua.treesitter.base and "lua", dots.languages.lua.treesitter.luadoc and "luadoc", dots.languages.lua.treesitter.patterns and "luap" })
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
  },
  dependencies = dots.languages.lua.LSP.neodev.enable and {
    {
      "folke/neodev.nvim",
      opts = dots.languages.lua.LSP.neodev.opts or {},
    },
  },
}
