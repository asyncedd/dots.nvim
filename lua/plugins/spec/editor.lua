return {
  {
    "numToStr/Comment.nvim",
    config = require("plugins.configs.editor.comment"),
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require("plugins.configs.editor.gitsigns"),
    event = "BufReadPost",
  },
  {
    "gbprod/yanky.nvim",
    config = true,
    event = "VeryLazy",
    keys = {
      { "p", "<Plug>(YankyPutAfter)", },
      { "P", "<Plug>(YankyPutBefore)" },
      { "gp", "<Plug>(YankyGPutAfter)" },
      { "gP", "<Plug>(YankyGPutBefore)" },
    }
  },
  {
    "kevinhwang91/nvim-ufo",
    config = require("plugins.configs.editor.ufo"),
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
}
