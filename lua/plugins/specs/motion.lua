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
    keys = {
      { "if", mode = { "o", "x" } },
      { "ic", mode = { "o", "x" } },
      { "af", mode = { "o", "x" } },
      { "ac", mode = { "o", "x" } },
      { "as", mode = { "o", "x" } },
    },
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    opts = function()
      return require("plugins.configs.motion.textsubjects")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    keys = {
      { ",", mode = { "o", "x" } },
      { ".", mode = { "o", "x" } },
      { ";", mode = { "o", "x" } },
      { "i;", mode = { "o", "x" } },
    },
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("plugins.highlight.motion.leap")
      require("plugins.configs.motion.leap")
    end,
    keys = {
      { "s", mode = { "n", "x", "o" } },
      { "S", mode = { "n", "x", "o" } },
      { "x", mode = { "x", "o" } },
      { "X", mode = { "x", "o" } },
    },
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  {
    "ggandor/leap-spooky.nvim",
    config = true,
    keys = {
      { "r", mode = "o" },
      { "R", mode = "o" },
    },
    dependencies = {
      "ggandor/leap.nvim",
    },
  },
}
