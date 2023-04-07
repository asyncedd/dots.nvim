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
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.configs.editor.autopairs")
    end,
    keys = {
      { "{", mode = { "i","c" } },
      { "}", mode = { "i", "c" } },
      { "(", mode = { "i", "c" } },
      { ")", mode = { "i", "c" } },
      { "[", mode = { "i", "c" } },
      { "]", mode = { "i", "c" } },
      { "'", mode = { "i", "c" } },
      { "\"", mode = { "i", "c" } },
    }
  },
}

