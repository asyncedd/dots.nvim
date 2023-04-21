return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    config = require("editor.comment"),
    event = "VeryLazy",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  -- Gitsigns!
  {
    "lewis6991/gitsigns.nvim",
    config = require("editor.gitsigns"),
    event = "BufReadPost",
  },
  -- Leap!
  {
    "ggandor/leap.nvim",
    config = require("editor.motion"),
    dependencies = {
      "tpope/vim-repeat",
      "echasnovski/mini.ai",
    },
    event = "VeryLazy",
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "andymass/vim-matchup",
      -- "David-Kunz/markid",
      "HiPhish/nvim-ts-rainbow2",
      "nvim-treesitter/nvim-treesitter-refactor",
    },
    config = require("editor.treesitter"),
    event = "BufReadPost",
    priority = 75,
  },
  -- TrailBlazer.nvim
  {
    "LeonHeidelbach/trailblazer.nvim",
    config = require("editor.trailblazer"),
    event = "VeryLazy",
  },
  -- I got harpooned, blazingly fast!
  {
    "theprimeagen/harpoon",
    config = require("editor.harpoon"),
    event = "VeryLazy",
  },
  -- Splitjoin
  {
    "echasnovski/mini.splitjoin",
    config = require("editor.splitjoin"),
    event = "VeryLazy",
  },
  -- Mini.surround - SurroundingYouBlazinglyFast!
  {
    "echasnovski/mini.surround",
    config = require("editor.surround"),
    event = "VeryLazy",
  },
}
