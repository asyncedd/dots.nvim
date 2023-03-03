local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    config = require("plugins.configs.editor.treesitter"),
    dependencies = {
      "David-Kunz/markid"
    },
    event = "BufReadPre"
  }
}

return M
