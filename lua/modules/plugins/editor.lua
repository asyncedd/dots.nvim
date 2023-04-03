local editor = {}

table.insert(editor, {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = require("modules.configs.editor.treesitter"),
  dependencies = {
    { "andymass/vim-matchup" },
  },
})

table.insert(editor, {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
})

return editor
