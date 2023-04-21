return {
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
      "ggandor/leap-spooky.nvim",
      "tpope/vim-repeat",
      "echasnovski/mini.ai",
    },
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
  },
}
