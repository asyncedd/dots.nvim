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
  {
    "abecodes/tabout.nvim",
    config = true,
    keys = {
      { "<Tab>", mode = "i" },
      { "<S-Tab>", mode = "i" },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    config = function()
      require("mini.splitjoin").setup()
    end,
    keys = {
      "gS",
    },
  },
}

