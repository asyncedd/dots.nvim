return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.configs.coding.autopairs")
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
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    keys = {
      "gcc",
      "gbc",
      { "gc", mode = { "v", "n" } },
      vim.v.count .. "gc",
      vim.v.count .. "gb",
      { "gb", mode = { "v", "n" } },
      "gc0",
      "gco",
      "gcA",
    },
  },
}

