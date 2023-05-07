return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    init = function()
      -- PERF: no need to load the plugin, if we only need its queries for mini.ai
      local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local enabled = false
      if opts.textobjects then
        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
          if opts.textobjects[mod] and opts.textobjects[mod].enable then
            enabled = true
            break
          end
        end
      end
      if not enabled then
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
      end
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("plugins.configs.motion.leap")
    end,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap foward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "x", mode = { "x", "o" }, desc = "Leap foward till" },
      { "X", mode = { "x", "o" }, desc = "Leap backward till" },
      { "gs", mode = { "x", "o" }, desc = "Leap from window" },
      { "gS", mode = { "x", "o" }, desc = "Leap backward to" },
    },
  },
  {
    "ggandor/flit.nvim",
    opts = {
      labeled_modes = "nvoi",
    },
    config = true,
    dependencies = {
      "leap.nvim",
    },
    keys = {
      { "f", mode = { "n", "x", "o" }, desc = "f" },
      { "F", mode = { "n", "x", "o" }, desc = "F" },
      { "t", mode = { "n", "x", "o" }, desc = "t" },
      { "T", mode = { "n", "x", "o" }, desc = "T" },
    },
  },
  {
    "echasnovski/mini.ai",
    opts = function()
      return require("plugins.configs.motion.ai")
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = {
      useDefaultKeymaps = true,
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    opts = function()
      return require("plugins.configs.motion.textsubjects")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
    },
  },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = {
      "leap.nvim",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "ggandor/leap-ast.nvim",
    keys = {
      {
        "gs",
        function()
          require("leap-ast").leap()
        end,
        mode = { "n", "x", "o" },
      },
    },
  },
  {
    "cbochs/portal.nvim",
    config = true,
    keys = {
      { "<C-i>", "<cmd>Portal jumplist forward<CR>" },
      { "<C-o>", "<cmd>Portal jumplist backward<CR>" },
    },
  },
  {
    "LeonHeidelbach/trailblazer.nvim",
    config = true,
    keys = {
      "<A-l>",
      "<A-b>",
      "<A-J>",
      "<A-K>",
      "<A-n>",
      "<A-m>",
      "<A-L>",
      "<A-p>",
      "<A-p>",
      "<A-P>",
      "<A-t>",
      "<A-.>",
      "<A-,>",
      "<A-s>",
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
        mode = "!",
      },
      {
        "<C-u>",
        function()
          require("readline").backward_kill_line()
        end,
        mode = "!",
      },
      {
        "<M-d>",
        function()
          require("readline").kill_word()
        end,
        mode = "!",
      },
      {
        "<M-BS>",
        function()
          require("readline").backward_kill_word()
        end,
        mode = "!",
      },
      {
        "<C-w>",
        function()
          require("readline").unix_word_rubout()
        end,
        mode = "!",
      },
      { "<C-d>", "<Delete>", mode = "!" },
      { "<C-h>", "<BS>", mode = "!" },
      {
        "<C-a>",
        function()
          require("readline").beginning_of_line()
        end,
        mode = "!",
      },
      {
        "<C-e>",
        function()
          require("readline").end_of_line()
        end,
        mode = "!",
      },
      {
        "<M-f>",
        function()
          require("readline").forward_word()
        end,
        mode = "!",
      },
      {
        "<M-b>",
        function()
          require("readline").backward_word()
        end,
        mode = "!",
      },
      { "<C-f>", "<Right>", mode = "!" },
      { "<C-b>", "<Left>", mode = "!" },
      { "<C-n>", "<Down>", mode = "!" },
      { "<C-p>", "<Up>", mode = "!" },
    },
  },
}
