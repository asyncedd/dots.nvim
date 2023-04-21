
    --
    return {
      -- Luasnip
      {
        "L3MON4D3/LuaSnip",
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
        config = true,
        keys = {
          {
            "<tab>",
            function()
              return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true,
            silent = true,
            mode = "i",
          },
          {
            "<tab>",
            function()
              require("luasnip").jump(1)
            end,
            mode = "s",
          },
          {
            "<s-tab>",
            function()
              require("luasnip").jump(-1)
            end,
            mode = { "i", "s" },
          },
        },
      },
      -- Completion
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-path",
          "petertriho/cmp-git",
          "saadparwaiz1/cmp_luasnip",
          "windwp/nvim-autopairs",
          "ray-x/cmp-treesitter",
        },
        config = require("completion.cmp"),
        event = "InsertEnter",
      },
    -- LSP.
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          "jay-babu/mason-null-ls.nvim",
          "folke/neodev.nvim",
          -- "ray-x/lsp_signature.nvim",
        },
        config = require("lsp.lspconfig"),
        event = "BufReadPost",
      },
      -- Mason.
      {
        "williamboman/mason.nvim",
        dependencies = {
          {
            "williamboman/mason-lspconfig.nvim",
            config = true,
          },
          {
            "jay-babu/mason-null-ls.nvim",
            opts = {
              automatic_setup = true,
            },
            config = true,
          },
        },
        opts = {
          ensure_installed = {
            "lua_ls",
            "rust_analyzer",
          },
          automatic_installation = true,
        },
        config = true,
      },
      -- Fidget.nvim - a plugin to show the LSP loading stuff.
      {
        "j-hui/fidget.nvim",
        config = require("lsp.fidget"),
        event = "VeryLazy",
      },
      -- Trouble.nvim - a plugin to show some LSP diagnostics in a tree menu!
      {
        "folke/trouble.nvim",
        config = require("lsp.trouble"),
        event = "VeryLazy",
      },
      -- LSPSaga - some cool stuff for LSP.
      {
        "glepnir/lspsaga.nvim",
        dependencies = {
          "nvim-tree/nvim-web-devicons",
          "nvim-treesitter/nvim-treesitter",
        },
        config = require("lsp.lspsaga"),
        event = "BufReadPost",
      },
      -- LSPSignature - show definations as you type!
      {
        "ray-x/lsp_signature.nvim",
        config = require("lsp.signature"),
        event = "VeryLazy",
      },
      -- NullLs - Do some non-LSP stuff as LSP.
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = require("lsp.nullLs"),
        event = "VeryLazy",
      },
    }
