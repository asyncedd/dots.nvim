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
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
      "ray-x/lsp_signature.nvim",
    },
    config = require("lsp.lspconfig"),
    event = "BufReadPost",
  },
  -- Fidget.nvim - a plugin to show the LSP loading stuff.
  {
    "j-hui/fidget.nvim",
    config = require("lsp.fidget"),
    event = "BufReadPost",
  },
  -- Trouble.nvim - a plugin to show some LSP diagnostics in a tree menu!
  {
    "folke/trouble.nvim",
    config = require("lsp.trouble"),
    event = "BufReadPost",
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
    event = "BufReadPost",
  },
  -- NullLs - Do some non-LSP stuff as LSP.
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = require("lsp.nullLs"),
    event = "BufReadPost",
  },
}
