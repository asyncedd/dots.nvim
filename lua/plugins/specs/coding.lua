return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("coding.Comment")
    end,
    keys = {
      "gcc",
      "gbc",
      { "gc", mode = { "v", "n" } },
      { "gb", mode = { "v", "n" } },
    },
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("coding.commentstring")
        end,
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "./luasnip" } })
      require("coding.luasnip")
    end,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "honza/vim-snippets",
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
      },
      {
        "molleweide/LuaSnip-snippets.nvim",
        config = function()
          require("luasnip.loaders.from_lua").lazy_load()
        end,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      -- {
      --   "tzachar/cmp-tabnine",
      --   build = "./install.sh",
      -- },
      -- {
      --   "jcdickinson/codeium.nvim",
      --   dependencies = {
      --     "nvim-lua/plenary.nvim",
      --   },
      --   config = true,
      --   enabled = false,
      -- },
      "hrsh7th/cmp-emoji",
      "chrisgrieser/cmp-nerdfont",
      "lukas-reineke/cmp-rg",
      "andersevenrud/cmp-tmux",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
    },
    config = function()
      require("coding.cmp")
    end,
  },
  {
    "gbprod/cutlass.nvim",
    keys = {
      "m",
    },
    config = function()
      require("coding.cutlass")
    end,
  },
  {
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup()
    end,
    keys = {
      { "<M-k>", mode = { "n", "v" } },
      { "<M-j>", mode = { "n", "v" } },
      { "<M-h>", mode = { "n", "v" } },
      { "<M-l>", mode = { "n", "v" } },
      { "<A-k>", mode = { "n", "v" } },
      { "<A-j>", mode = { "n", "v" } },
      { "<A-h>", mode = { "n", "v" } },
      { "<A-l>", mode = { "n", "v" } },
    },
  },
  {
    "gbprod/substitute.nvim",
    config = true,
    keys = {
      {
        ",s",
        function()
          require("substitute").operator()
        end,
      },
      {
        ",ss",
        function()
          require("substitute").line()
        end,
      },
      {
        ",S",
        function()
          require("substitute").eol()
        end,
      },
      {
        ",s",
        function()
          require("substitute").operator()
        end,
        mode = { "v", "x" },
      },
    },
  },
  {
    "RRethy/nvim-treesitter-endwise",
    config = function()
      require("coding.endwise")
    end,
    event = "InsertEnter",
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("coding.refactoring")
    end,
    keys = {
      {
        "<leader>re",
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        mode = "v",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rf",
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        mode = "v",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rv",
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        mode = "v",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>ri",
        "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        mode = "v",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rb",
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rbf",
        "<Esc><Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>ri",
        "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        { noremap = true, silent = true, expr = false },
      },
    },
  },
}
