return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("coding.autopairs")
    end,
    keys = {
      { "{", mode = { "i","c" } },
      { "}", mode = { "i", "c" } },
      { "(", mode = { "i", "c" } },
      { ")", mode = { "i", "c" } },
      { "[", mode = { "i", "c" } },
      { "]", mode = { "i", "c" } },
      { "'", mode = { "i", "c" } },
      { "\"", mode = { "i", "c" } },
    }
  },
  {
    "abecodes/tabout.nvim",
    config = true,
    keys = {
      { "<Tab>", mode = "i" },
      { "<S-Tab>", mode = "i" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    after = {
      "hrs7th/nvim-cmp",
    },
  },
  {
    "echasnovski/mini.splitjoin",
    config = function()
      require("mini.splitjoin").setup()
    end,
    keys = {
      "gS",
    },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    keys = {
      "gcc",
      "gbc",
      { "gc", mode = { "v", "n" } },
      vim.v.count .. "gc",
      vim.v.count .. "gb",
      { "gb", mode = { "v", "n" } },
      "gc0",
      "gco",
      "gcA",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
        end,
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function ()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
          {
            "honza/vim-snippets",
            config = function()
              require("luasnip.loaders.from_snipmate").lazy_load()
            end,
          },
        },
      },
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
      "lukas-reineke/cmp-rg",
      "andersevenrud/cmp-tmux",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "chrisgrieser/cmp-nerdfont",
    },
    config = function()
      require("coding.cmp")
    end,
  },
}

