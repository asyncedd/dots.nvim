local editor = {}

table.insert(editor, {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = require("modules.configs.editor.treesitter"),
  dependencies = {
    { "andymass/vim-matchup" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
})

table.insert(editor, {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = require("modules.configs.editor.comment")
})

return editor
