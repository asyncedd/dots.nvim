return {
  {
    "altermo/npairs-integrate-upair",
    config = function()
      require("coding.autopairs")
    end,
    dependencies = {
      "altermo/ultimate-autopair.nvim",
      "windwp/nvim-autopairs",
    },
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
  },
  {
    "abecodes/tabout.nvim",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    after = {
      "hrs7th/nvim-cmp",
    },
    event = {
      "InsertEnter",
    },
  },
  {
    "Wansmer/treesj",
    config = true,
    keys = {
      { "gS", "<cmd>lua require('treesj').toggle()<CR>" },
    },
  },
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
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
      },
      {
        "jcdickinson/codeium.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        config = true,
      },
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
}
