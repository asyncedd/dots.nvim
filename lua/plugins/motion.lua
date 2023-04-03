return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
      { "ggandor/flit.nvim" },
      { "ggandor/leap-spooky.nvim" },
      { "tpope/vim-repeat" },
    },
    config = require("configs.editor.motion")
  }
}
