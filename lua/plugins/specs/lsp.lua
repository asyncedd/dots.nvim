return not dots.LSP.enabled and {}
  or {
    {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers_to_not_setup = dots.LSP.config.opts.servers_to_not_setup or {},
          servers = dots.LSP.config.opts.servers or {},
          setup = dots.LSP.config.opts.setup or {},
        },
        enabled = dots.LSP.config.enabled,
        event = "VeryLazy",
        config = function(_, opts)
          require("plugins.configs.lsp.config")(opts)
        end,
        dependencies = {
          {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
              {
                "williamboman/mason.nvim",
                opts = true,
              },
            },
          },
        },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {},
      },
      enabled = dots.LSP.null.enabled,
      event = "VeryLazy",
      config = function(_, opts)
        require("plugins.configs.lsp.null")(opts)
      end,
      dependencies = "nvim-lua/plenary.nvim",
    },
  }
