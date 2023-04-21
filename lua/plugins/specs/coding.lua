return {
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

