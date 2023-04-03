return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = require("configs.editor.treesitter"),
    event = "BufReadPost"
  }
}
