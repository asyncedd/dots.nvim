return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("plugins.configs.editor.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    build = ":TSUpdate",
    event = { "BufReadPost" }
  },
  {
    "andymass/vim-matchup",
    opts = function()
      return require("plugins.configs.editor.matchup")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      
      vim.cmd("silent! do FileType")
    end,
    event = "VeryLazy",
  },
}
