return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    config = require("plugins.configs.editor.comment"),
    event = "VeryLazy",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  -- Gitsigns!
  {
    "lewis6991/gitsigns.nvim",
    config = require("plugins.configs.editor.gitsigns"),
    event = "BufReadPost",
  },
  -- Leap!
  {
    "ggandor/leap.nvim",
    config = require("plugins.configs.editor.motion"),
    dependencies = {
      {
        "ggandor/flit.nvim",
        keys = function()
          local ret = {}
          for _, key in ipairs({ "f", "F", "t", "T" }) do
            ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
          end
          return ret
        end,
        opts = { labeled_modes = "nx" },
      },
      "tpope/vim-repeat",
      "echasnovski/mini.ai",
    },
    event = "VeryLazy"
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "andymass/vim-matchup",
      "David-Kunz/markid",
    },
    config = require("plugins.configs.editor.treesitter"),
    event = "BufReadPost",
    priority = 100,
  },
  -- TrailBlazer.nvim
  {
    "LeonHeidelbach/trailblazer.nvim",
    config = require("plugins.configs.editor.trailblazer"),
    event = "VeryLazy",
  },
  -- I got harpooned, blazingly fast!
  {
    "theprimeagen/harpoon",
    config = require("plugins.configs.editor.harpoon"),
    event = "VeryLazy"
  },
   -- Splitjoin
  {
    "echasnovski/mini.splitjoin",
    config = require("plugins.configs.editor.splitjoin"),
    event = "VeryLazy",
  }
}
