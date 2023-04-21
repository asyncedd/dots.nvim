local M = {
  {
    "kevinhwang91/nvim-ufo",
    config = require("plugins.configs.editor.ufo"),
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async"
    }
  },
}

return M
