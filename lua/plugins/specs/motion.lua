return {
  {
    "chrisgrieser/nvim-spider",
    config = function()
      require("plugins.configs.motion.spider")
    end,
    keys = {
      { "w", mode = { "n", "x", "o" } },
      { "e", mode = { "n", "x", "o" } },
      { "b", mode = { "n", "x", "o" } },
      { "ge", mode = { "n", "x", "o" } },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = function()
      return require("plugins.configs.motion.textobj")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    opts = function()
      return require("plugins.configs.motion.textsubjects")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("plugins.highlight.motion.leap")
      require("plugins.configs.motion.leap")
    end,
    event = "VeryLazy",
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  {
    "ggandor/leap-spooky.nvim",
    config = true,
    event = "VeryLazy",
    dependencies = {
      "ggandor/leap.nvim",
    },
  },
  {
    "ggandor/flit.nvim",
    opts = function()
      return require("plugins.configs.motion.flit")
    end,
    config = true,
    dependencies = {
      "ggandor/leap.nvim",
      "tpope/vim-repeat",
    },
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.ai",
    opts = function()
      return require("plugins.configs.motion.mini-ai")
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
    event = "VeryLazy",
  },
}
