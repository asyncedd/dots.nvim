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
}
