local editor = {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = require("editor.treesitter"),
    dependencies = {
      { "andymass/vim-matchup" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "windwp/nvim-ts-autotag" },
      -- { "p00f/nvim-ts-rainbow" },
      { "nvim-treesitter/playground" },
      { "HiPhish/nvim-ts-rainbow2" }
    },
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = require("editor.comment")
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = require("editor.autopairs"),
  },

  {
    "folke/twilight.nvim",
    event = "BufReadPost",
    config = require("editor.twilight"),
  },

  {
    "echasnovski/mini.cursorword",
    event = "BufReadPost",
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = require("editor.gitsigns"),
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    config = require("editor.ufo"),
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = require("editor.which_key")
  },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = require("editor.leap")
  },
}

return editor
