local editor = {}

table.insert(editor, {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = require("modules.configs.editor.treesitter")
})

return editor
