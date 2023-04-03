local M = {
  {
    "numToStr/Comment.nvim",
    config = require("plugins.configs.editor.comment"),
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require("plugins.configs.editor.gitsigns"),
    event = "BufReadPost",
  }
}

return M
