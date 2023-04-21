local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.configs.editor.treesitter")
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
}

