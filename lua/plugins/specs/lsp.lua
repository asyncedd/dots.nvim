return {
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
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
            expr = true, silent = true, mode = "i",
          },
          { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
          { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
      },
    },
    event = "InsertEnter",
    config = function()
      require("plugins.configs.completion.cmp")
    end,
  },
  -- LSP.
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
      require("plugins.configs.lsp.lspconfig")
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true,
        cmd = "Mason",
      },
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      {
        "j-hui/fidget.nvim",
        opts = {
          text = {
            spinner = "dots"
          }
        },
        config = true,
      },
      {
        "folke/trouble.nvim",
        config = true,
      },
      "folke/neodev.nvim",
    }
  },
  -- LSPSaga
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      ui = {
        theme = 'round',
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
      }
    },
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
