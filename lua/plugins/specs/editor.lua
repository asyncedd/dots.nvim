local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("editor.treesitter")
    end,
    init = lazyLoad("nvim-treesitter"),
  },
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup()
    end,
    keys = {
      { "vi", mode = { "x", "o", "n", "v" } },
      { "va", mode = { "x", "o", "n", "v" } },
    },
  },
  {
    "echasnovski/mini.bracketed",
    config = function()
      require("mini.bracketed").setup()
    end,
    keys = {
      { "[", mode = { "x", "o", "n", "v" } },
      { "]", mode = { "x", "o", "n", "v" } },
    },
  },
  {
    "echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup()
    end,
    keys = {
      "<leader>s",
    }
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x" } },
      { "S", mode = { "n", "x" } },
      { "x", mode = { "v" } },
      { "X", mode = { "v" } },
      { "ms", function() require("editor.leapMulti") end },
    },
    config = function()
      require("editor.leap")
    end,
  },
  {
    "ggandor/flit.nvim",
    keys = {
      { "f", mode = { "n", "v" } },
      { "F", mode = { "n", "v" } },
      { "t", mode = { "n", "v" } },
      { "T", mode = { "n", "v" } },
    },
    config = true,
  },
  {
    "ggandor/leap-spooky.nvim",
    keys = {
      "b", "B", "c", "C", "d", "D", "g", "G", "h", "H", "j", "J", "k",
      "K", "l", "L", "m", "M", "q", "Q", "r", "R", "x", "X", "z", "Z",
    },
    config = true,
  },
  {
    "ggandor/leap-ast.nvim",
    config = true,
    keys = {
      { "<leader>lp", function() require("leap-ast").leap() end },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    init = lazyLoad("gitsigns.nvim"),
    config = function()
      require("editor.gitsigns")
    end,
  },
  {
    "folke/todo-comments.nvim",
    init = lazyLoad("todo-comments.nvim"),
    config = true,
  },
}

