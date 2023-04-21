local editor = {}

editor["nvim-treesitter/nvim-treesitter"] = {
  event = "BufReadPre",
  config = require("editor.treesitter"),
  dependencies = {
    { "andymass/vim-matchup" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "windwp/nvim-ts-autotag" },
    -- { "p00f/nvim-ts-rainbow" },
  { "nvim-treesitter/playground" }
  },
}

editor["numToStr/Comment.nvim"] = {
  event = "VeryLazy",
}

editor["windwp/nvim-autopairs"] = {
  event = "InsertEnter",
  config = require("editor.autopairs"),
}

editor["folke/twilight.nvim"] = {
  event = "BufReadPost",
  config = require("editor.twilight"),
}

editor["echasnovski/mini.cursorword"] = {
  event = "BufReadPost",
}

editor["lewis6991/gitsigns.nvim"] = {
  event = "BufReadPost",
  config = require("editor.gitsigns"),
}

editor["kevinhwang91/nvim-ufo"] = {
  event = "BufReadPost",
  config = require("editor.ufo"),
  dependencies = {
    "kevinhwang91/promise-async",
  },
}

editor["folke/which-key.nvim"] = {
  event = "VeryLazy",
  config = require("editor.which_key")
}

editor["ggandor/leap.nvim"] = {
  event = "VeryLazy",
  config = require("editor.leap")
}

return editor
