return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    config = function()
      require("lspconfig").lua_ls.setup({
        capabilities = require("plugins.configs.lsp.config").capabilities,
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
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
              checkThirdParty = false,
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
}
