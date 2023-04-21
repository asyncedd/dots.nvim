local editor = {}

editor["nvim-treesitter/nvim-treesitter"] = {
  event = "BufReadPre",
  config = require("editor.treesitter"),
  dependencies = {
    { "andymass/vim-matchup" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "windwp/nvim-ts-autotag" },
    { "nvim-treesitter/nvim-treesitter-refactor" },
    -- { "p00f/nvim-ts-rainbow" }
  },
}

editor["numToStr/Comment.nvim"] = {
  event = "VeryLazy",
  config = require("editor.comment")
}

editor["windwp/nvim-autopairs"] = {
  event = "InsertEnter",
  config = require("editor.autopairs")
}

editor["folke/twilight.nvim"] = {
  event = "BufReadPost",
  config = require("editor.twilight")
}

editor["RRethy/vim-illuminate"] = {
  event = "BufReadPost"
}

editor["lewis6991/gitsigns.nvim"] = {
  event = "BufReadPost",
  config = require("editor.gitsigns")
}

return editor
