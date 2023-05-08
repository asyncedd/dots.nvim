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
    build = ":TSUpdate",
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
    init = function()
      require("core.utils.lazy_load")("gitsigns.nvim")
    end,
  },
  {
    "folke/which-key.nvim",
    opts = function()
      return require("plugins.configs.editor.which-key")
    end,
    event = "VeryLazy",
  },
}
