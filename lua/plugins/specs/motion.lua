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
      "Ma",
      "Mb",
      "Mj",
      "Mk",
      "MM",
      "ML",
      "Mn",
      "MN",
      "Mt",
      "M[",
      "M]",
      "Ms",
    },
    cmd = {
      "TrailBlazerNewTrailMark",
      "TrailBlazerTrackBack",
      "TrailBlazerPeekMovePreviousUp",
      "TrailBlazerPeekMoveNextDown",
      "TrailBlazerDeleteAllTrailMarks",
      "TrailBlazerPasteAtLastTrailMark",
      "TrailBlazerPasteAtAllTrailMarks",
      "TrailBlazerTrailMarkSelectMode",
      "TrailBlazerToggleTrailMarkList",
      "TrailBlazerSwitchTrailMarkStack",
      "TrailBlazerAddTrailMarkStack",
      "TrailBlazerDeleteTrailMarkStacks",
      "TrailBlazerDeleteAllTrailMarkStacks",
      "TrailBlazerSwitchNextTrailMarkStack",
      "TrailBlazerSwitchPreviousTrailMarkStack",
      "TrailBlazerSetTrailMarkStackSortMode",
    },
    config = function()
      require("motion.trailblazer")
    end,
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
      {
        "gnh",
        "<cmd>STSSwapOrHold<cr>",
      },
      {
        "gnh",
        "<cmd>STSSwapOrHoldVisual<cr>",
        mode = { "x", "v" },
      },
      {
        "<leader>hj",
        function()
          require("syntax-tree-surfer").targeted_jump({
            "function",
            "arrrow_function",
            "function_defination",
            "if_statement",
            "else_clause",
            "else_statement",
            "elseif_statement",
            "for_statement",
            "while_statement",
            "switch_statement",
            "variable_declaration",
          })
        end,
      },
    },
  },
  {
    "mizlan/iswap.nvim",
    config = function()
      require("motion.iswap")
    end,
    cmd = {
      "ISwap",
      "ISwapWith",
      "ISwapNode",
    },
    keys = {
      { "<leader>is", "<cmd>ISwap<cr>" },
    },
  },
  {
    "woosaaahh/sj.nvim",
    config = true,
    keys = {
      {
        "<leader><leader>s",
        function()
          require("sj").run()
        end,
      },
      {
        "<A-,>",
        function()
          require("sj").prev_match()
        end,
      },
      {
        "<A-;>",
        function()
          require("sj").next_match()
        end,
      },
      {
        "<leader>su",
        function()
          require("sj").redo()
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-treehopper",
    dependencies = {
      "phaazon/hop.nvim",
    },
    keys = {
      { "<leader>th", "<cmd>lua require('tsht').nodes()<cr>" },
    },
  },
  {
    "drybalka/tree-climber.nvim",
    keys = {
      {
        "H",
        function()
          require("tree-climber").goto_parent()
        end,
        mode = { "n", "v", "x" },
      },
      {
        "L",
        function()
          require("tree-climber").goto_child()
        end,
        mode = { "n", "v", "x" },
      },
      {
        "J",
        function()
          require("tree-climber").goto_next()
        end,
        mode = { "n", "v", "x" },
      },
      {
        "K",
        function()
          require("tree-climber").goto_prev()
        end,
        mode = { "n", "v", "x" },
      },
      {
        "<leader>in",
        function()
          require("tree-climber").select_node()
        end,
        mode = { "v", "o" },
      },
      {
        "<C-k>",
        function()
          require("tree-climber").swap_prev()
        end,
      },
      {
        "<C-j>",
        function()
          require("tree-climber").swap_next()
        end,
      },
      {
        "<C-h>",
        function()
          require("tree-climber").highlight_node()
        end,
      },
    },
  },
}
