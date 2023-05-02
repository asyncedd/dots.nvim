return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("plugins.configs.editor.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      require("plugins.highlight.editor.treesitter")
    end,
    event = { "BufReadPost", "BufNewFile", "BufWinEnter" },
  },
  {
    "kevinhwang91/nvim-ufo",
    opts = function()
      return require("plugins.configs.editor.ufo")
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require("plugins.configs.editor.gitsigns")
    end,
    config = true,
    event = { "BufReadPost" },
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    opts = function()
      return require("plugins.configs.editor.refactor")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      "nvim-treesitter",
    },
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
    event = "VeryLazy",
  },
}
