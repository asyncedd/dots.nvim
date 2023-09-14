return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      {
        "s",
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        function()
          require("flash").treesitter()
        end,
        desc = "Flash tree-sitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      { "f", mode = { "n", "x", "o" } },
      { "F", mode = { "n", "x", "o" } },
      { "t", mode = { "n", "x", "o" } },
      { "T", mode = { "n", "x", "o" } },
    },
    event = {
      "CmdlineEnter",
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup({
        context_commentstring = {
          enable = true,
        },
      })

      require("Comment").setup(opts)
    end,
    keys = {
      { "gc", mode = { "x", "n" } },
      { "gb", mode = { "x", "n" } },
    },
    dependencies = {
      "nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function()
        local gs = require("gitsigns")

        local map = vim.keymap.set

          -- stylua: ignore start
          map("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
          map("n", "[h", gs.prev_hunk, { desc= "Prev Hunk" })
      end,
    },
  },
  {
    "andymass/vim-matchup",
    opts = {
      matchup = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.g.matchup_matchparen_offscreen = {}
    end,
    event = "VeryLazy",
    dependencies = "nvim-treesitter",
  },
  {
    "Wansmer/treesj",
    opts = {
      use_default_keymaps = false,
      max_join_length = 1000,
    },
    keys = {
      { "gS", "<cmd>lua require('treesj').toggle()<CR>", desc = "TreeSJ - toggle" },
    },
  },
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
    opts = function()
      return {
        highlight = { timer = 200 },
        ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
      }
    end,
    keys = {
      -- stylua: ignore
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },
  {
    "kylechui/nvim-surround",
    opts = true,
    keys = {
      { "s", mode = { "x", "o" } },
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    keys = {
      { "gG", "<cmd>lua require('various-textobjs').entireBuffer()<CR>", mode = { "x", "o" } },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
  },
  {
    "gbprod/substitute.nvim",
    opts = true,
    keys = {
      {
        "gx",
        function(...)
          require("substitute").operator(...)
        end,
      },
      {
        "gxx",
        function(...)
          require("substitute").line(...)
        end,
      },
      {
        "gX",
        function(...)
          require("substitute").eol(...)
        end,
      },
      {
        "X",
        function(...)
          require("substitute").visual(...)
        end,
        mode = "x",
      },
      {
        "<leader>x",
        function(...)
          require("substitute.range").operator(...)
        end,
      },
      {
        "<leader>x",
        function(...)
          require("substitute.range").visual(...)
        end,
        mode = "x",
      },
      {
        "zx",
        function(...)
          require("substitute.exchange").operator(...)
        end,
      },
      {
        "zxx",
        function(...)
          require("substitute.exchange").line(...)
        end,
      },
      {
        "zX",
        function(...)
          require("substitute.exchange").visual(...)
        end,
        mode = "x",
      },
      {
        "zxc",
        function()
          require("substitute.exchange").cancel()
        end,
      },
    },
  },
}
