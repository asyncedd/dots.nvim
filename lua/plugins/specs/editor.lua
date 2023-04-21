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
      "<leader>s",
    },
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x" } },
      { "S", mode = { "n", "x" } },
      { "x", mode = { "v" } },
      { "X", mode = { "v" } },
      {
        "ms",
        function()
          require("editor.leapMulti")
        end,
      },
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
    config = true,
    keys = {
      "d",
      "c",
      "y",
      "g",
      "!",
      "=",
      ">",
      "<",
    },
  },
  {
    "ggandor/leap-ast.nvim",
    config = true,
    keys = {
      {
        "<leader>lp",
        function()
          require("leap-ast").leap()
        end,
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
    "LeonHeidelbach/trailblazer.nvim",
    keys = {
      "<A-l>",
      "<A-b>",
      "<A-J>",
      "<A-K>",
      "<A-n>",
      "<A-m>",
      "<A-L>",
      "<A-p>",
      "<A-P>",
      "<A-t>",
      "<A-.>",
      "<A-,>",
      "<A-s>",
      "<A-j>",
      "<A-k>",
    },
    config = true,
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "x", "o", "n" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "x", "o", "n" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "x", "o", "n" } },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "x", "o", "n" } },
    },
  },
  {
    "cbochs/portal.nvim",
    keys = {
      { "<leader>o", "<cmd>Portal jumplist backward<cr>" },
      { "<leader>i", "<cmd>Portal jumplist forward<cr>" },
    },
    dependencies = {
      "cbochs/grapple.nvim",
      "ThePrimeagen/harpoon",
    },
  },
  {
    "linty-org/readline.nvim",
    keys = {
      {
        "<C-k>",
        function()
          require("readline").kill_line()
        end,
        mode = { "i" },
      },
      {
        "<C-u>",
        function()
          require("readline").backward_kill_line()
        end,
        mode = { "i" },
      },
      {
        "<M-d>",
        function()
          require("readline").kill_word()
        end,
        mode = { "i" },
      },
      {
        "<M-BS>",
        function()
          require("readline").backward_kill_word()
        end,
        mode = { "i" },
      },
      {
        "<C-w>",
        function()
          require("readline").unix_word_rubout()
        end,
        mode = { "i" },
      },
      { "<C-d>", "<Delete>", mode = { "i" } },
      { "<C-h>", "<BS>", mode = { "i" } },
      {
        "<C-a>",
        function()
          require("readline").beginning_of_line()
        end,
        mode = { "i" },
      },
      {
        "<M-m>",
        function()
          require("readline").back_to_indentation()
        end,
        mode = { "i" },
      },
      {
        "<C-e>",
        function()
          require("readline").end_of_line()
        end,
        mode = { "i" },
      },
      {
        "<M-f>",
        function()
          require("readline").forward_word()
        end,
        mode = { "i" },
      },
      {
        "<M-b>",
        function()
          require("readline").backward_word()
        end,
        mode = { "i" },
      },
      { "<C-f>", "<Right>", mode = { "i" } },
      { "<C-b>", "<Left>", mode = { "i" } },
    },
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
}
