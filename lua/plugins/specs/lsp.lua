return {
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
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
    event = "BufReadPre",
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
      "folke/neodev.nvim",
      {
        "ray-x/lsp_signature.nvim",
        config = true
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
      text = {
        spinner = "dots"
      }
    },
    config = true,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufReadPost",
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
  {
    'ray-x/navigator.lua',
    dependencies = {
      { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    },
    event = "VeryLazy",
    config = true,
  },
}
