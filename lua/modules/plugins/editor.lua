local editor = {}

table.insert(editor, {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = require("modules.configs.editor.treesitter"),
  dependencies = {
    { "andymass/vim-matchup" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "windwp/nvim-ts-autotag" },
    { "nvim-treesitter/nvim-treesitter-refactor" },
  },
})

table.insert(editor, {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = require("modules.configs.editor.comment")
})

table.insert(editor, {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = require("modules.configs.editor.autopairs")
})

table.insert(editor, {
  "folke/twilight.nvim",
  event = "BufReadPost",
})

return editor
