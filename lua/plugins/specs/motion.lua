return {
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
          require("motion.leapMulti")
        end,
      },
    },
    config = function()
      require("motion.leap")
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
    "ziontee113/syntax-tree-surfer",
    config = function()
      require("motion.treeSurfer")
    end,
    keys = {
      {
        "gv",
        function()
          require("syntax-tree-surfer").targeted_jump({ "variable_declaration" })
        end,
        mode = { "n", "v" },
      },
      {
        "gfu",
        function()
          require("syntax-tree-surfer").targeted_jump({ "function", "arrrow_function", "function_defination" })
        end,
        mode = { "n", "v" },
      },
      {
        "gif",
        function()
          require("syntax-tree-surfer").targeted_jump({ "if_statement" })
        end,
        mode = { "n", "v" },
      },
      {
        "gfo",
        function()
          require("syntax-tree-surfer").targeted_jump({ "for_statement" })
        end,
        mode = { "n", "v" },
      },
      {
        "hj",
        function()
          require("syntax-tree-surfer").targeted_jump({
            "function",
            "if_statement",
            "else_clause",
            "else_statement",
            "elseif_statement",
            "for_statement",
            "while_statement",
            "switch_statement",
          })
        end,
        mode = { "n", "v" },
      },
      {
        "-",
        function()
          require("syntax-tree-surfer").filtered_jump(
            { "if_statement", "else_clause", "else_statement" },
            false,
            { destination = "siblings" }
          )
        end,
        mode = { "n", "v" },
      },
      {
        "_",
        function()
          require("syntax-tree-surfer").filtered_jump(
            { "if_statement", "else_clause", "else_statement" },
            false,
            { destination = "parent" }
          )
        end,
        mode = { "n", "v" },
      },
      {
        "+",
        function()
          require("syntax-tree-surfer").filtered_jump(
            { "if_statement", "else_clause", "else_statement" },
            false,
            { destination = "children" }
          )
        end,
        mode = { "n", "v" },
      },
    },
  },
}
