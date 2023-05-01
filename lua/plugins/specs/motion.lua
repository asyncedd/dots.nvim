return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = function()
      return require("plugins.configs.motion.nvim-treesitter-textobjects")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = "VeryLazy",
  },
}
