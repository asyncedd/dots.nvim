return dots.languages.c ~= true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          clangd = {
            on_attach = function(client, bufnr)
              client.server_capabilities.signatureHelpProvider = false
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end,
          },
        },
        setup = {
          clangd = function(_, opts)
            local clangd_ext_opts = require("core.utils.lazyvim").opts("clangd_extensions.nvim")
            require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
            return true
          end,
        },
      },
    },
    {
      "p00f/clangd_extensions.nvim",
      opts = {
        extensions = {
          inline_hints = false,
        },
      },
      setup = function() end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          clang_format = {},
        },
      },
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
