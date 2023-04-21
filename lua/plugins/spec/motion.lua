local M = {
  {
    "ggandor/leap.nvim",
    config = require("plugins.configs.editor.motion"),
    dependencies = {
      "ggandor/flit.nvim",
      "ggandor/leap-spooky.nvim",
      "tpope/vim-repeat",
      "echasnovski/mini.ai",
    },
    event = "VeryLazy",
  },
}

return M
