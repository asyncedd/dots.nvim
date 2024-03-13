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
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")

      require("nvim-treesitter.configs").setup(opts)
    end,
    priority = 1000,
    event = { "BufReadPost", "User FilePost" },
  },
  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      {
        "s",
        '<cmd>lua require("flash").jump()<CR>',
        desc = "Flash",
      },
      {
        "S",
        '<cmd>lua require("flash").treesitter()<CR>',
        desc = "Flash tree-sitter",
      },
      {
        "r",
        mode = "o",
        '<cmd>lua require("flash").remote()<CR>',
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        '<cmd>lua require("flash").treesitter_search()<CR>',
        desc = "Treesitter Search",
      },
      { "f", mode = { "n", "x", "o" } },
      { "F", mode = { "n", "x", "o" } },
      { "t", mode = { "n", "x", "o" } },
      { "T", mode = { "n", "x", "o" } },
      "/",
      "?",
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    keys = {
      { "gc", mode = { "x", "n" } },
      { "gb", mode = { "x", "n" } },
    },
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
          context_commentstring = {
            enable = true,
          },
        },
        dependencies = {
          "nvim-treesitter/nvim-treesitter",
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = {
      signs = dots.UI.icons.Gitsigns,
      on_attach = function()
        local gs = require("gitsigns")

        local map = vim.keymap.set

          -- stylua: ignore start
          map("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
          map("n", "[h", gs.prev_hunk, { desc= "Prev Hunk" })
      end,
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
    end,
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
    "kylechui/nvim-surround",
    opts = true,
    keys = {
      "ys",
      "yS",
      "yss",
      "ySS",
      { "S", mode = "x" },
      "cs",
      "ds",
      "css",
      "dss",
    },
  },
  {
    "echasnovski/mini.clue",
    opts = function()
      return require("plugins.configs.editor.mini-clue")
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.ai",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
      end,
    },
    keys = {
      { "i", mode = { "x", "o" } },
      { "a", mode = { "x", "o" } },
    },
  },
  {
    "echasnovski/mini.operators",
    opts = true,
    keys = {
      { "g=", mode = { "x", "o", "n" }, desc = "Evaluate text and replace with output" },
      { "gx", mode = { "x", "o", "n" }, desc = "Exchange text regions" },
      { "gm", mode = { "x", "o", "n" }, desc = "Multiply (duplicate) text" },
      { "gr", mode = { "x", "o", "n" }, desc = "Replace text with register" },
      { "gs", mode = { "x", "o", "n" }, desc = "Sort text" },
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
    "rmagatti/auto-session",
    event = "BufReadPre",
    opts = {
      session_lens = {
        load_on_setup = false,
      },
    },
    init = function()
      local function restore()
        if vim.fn.argc(-1) > 0 then
          return
        end

        vim.schedule(function()
          require("auto-session").AutoRestoreSession()
        end)
      end

      local lazy_view_win = nil

      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          local lazy_view = require("lazy.view")

          if lazy_view.visible() then
            lazy_view_win = lazy_view.view.win
          else
            restore()
          end
        end,
      })

      vim.api.nvim_create_autocmd("WinClosed", {
        callback = function(event)
          if not lazy_view_win or event.match ~= tostring(lazy_view_win) then
            return
          end

          restore()
        end,
      })
    end,
  },
}
