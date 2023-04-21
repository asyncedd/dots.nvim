local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("editor.treesitter")
    end,
    init = lazyLoad("nvim-treesitter"),
    build = ":TSUpdate",
    dependencies = {
      "andymass/vim-matchup",
    },
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
      {
        "<leader>s",
        mode = { "x", "o", "n", "v" },
      },
    },
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
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
      },
      "za",
    },
    config = function()
      require("editor.ufo")
    end,
  },
  {
    "chrisgrieser/nvim-recorder",
    config = true,
    keys = {
      "q",
      "Q",
      vim.v.count .. "q",
      vim.v.count .. "Q",
      "<C-q>",
      "cq",
      "yq",
      "##",
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    ft = {
      "md",
      "markdown",
    },
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
    event = "UIEnter",
  },
}
