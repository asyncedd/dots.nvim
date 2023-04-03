return {
  {
    "numToStr/Comment.nvim",
    config = true,
    event = "VeryLazy",
  },
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
  {
    "gbprod/yanky.nvim",
    config = true,
    event = "VeryLazy",
    keys = {
      { "p", "<Plug>(YankyPutAfter)", },
      { "P", "<Plug>(YankyPutBefore)" },
      { "gp", "<Plug>(YankyGPutAfter)" },
      { "gP", "<Plug>(YankyGPutBefore)" },
    }
  },
  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require("plugins.configs.editor.ufo")
    end,
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
}
