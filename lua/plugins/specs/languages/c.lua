return dots.languages.c ~= true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        clangd = {
          on_attach = function(client, bufnr)
            client.server_capabilities.signatureHelpProvider = false
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
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
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = {
        "mason.nvim",
        "nvim-dap",
      },
    },
  }
