return {
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
      -- "ggandor/leap-spooky.nvim",
      "tpope/vim-repeat",
      -- "echasnovski/mini.ai",
    },
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
  },
  -- {
  --   "LeonHeidelbach/trailblazer.nvim",
  --   opts = {
  --     keymaps = {
  --       -- Jump to next mark
  --       next_mark = '<leader>l',
  --       -- Jump to previous mark
  --       prev_mark = '<leader>h',
  --       -- Toggle clairvoyant mode
  --       clairvoyant_mode = '<leader>c',
  --     },
  --   },
  --   config = true,
  --   event = "VeryLazy",
  -- }
}
