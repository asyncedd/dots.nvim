return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("plugins.configs.editor.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = { "BufReadPost", "BufNewFile", "BufWinEnter" },
  },
}
