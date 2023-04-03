return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
      { "ggandor/flit.nvim" },
      { "ggandor/leap-spooky.nvim" },
      { "tpope/vim-repeat" },
      { "echasnovski/mini.ai" },
    },
    config = require("configs.editor.motion")
  }
}
