return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    config = true,
    event = "BufReadPost",
  },
  -- Gitsigns!
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    },
    config = true,
    event = "BufReadPost",
  },
  -- Leap!
  {
    "ggandor/leap.nvim",
    config = function()
      require("plugins.configs.editor.motion")
    end,
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
    config = function ()
      require("plugins.configs.editor.treesitter")
    end,
    event = "BufReadPost",
  },
}
