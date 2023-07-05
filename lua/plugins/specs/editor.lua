--
--  ┌
--  │             Plugins for enhancing the editor
--  └

return {
  {
    "kevinhwang91/nvim-ufo",
    opts = {
      provider_selector = function()
        return {
          "treesitter",
          "indent",
        }
      end,
    },
    dependencies = {
      "kevinhwang91/promise-async",
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          vim.schedule(function()
            require("lazy").load({ plugins = "nvim-ufo" })
          end)
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_formatter = "󰧮 <author>, <author_time:%Y-%m-%d> - <summary>",
      trouble = false,
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
    config = true,
    init = function()
      require("core.utils.lazy")("gitsigns.nvim")
    end,
  },
  {
    "olimorris/persisted.nvim",
    opts = true,
    config = function(_, opts)
      require("persisted").setup(opts)

      vim.cmd("SessionStart")
    end,
    cmd = {
      "SessionLoad",
      -- Load all other Session commands when, "Session" is typed.
      -- Thus, providing autocompletion for other commands.
      "Session",
    },
    event = { "VeryLazy" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- NOTE: Install all of these.
      ensure_installed = {
        -- NOTE: You may think that you don't need the Vimscript parser if you mainly use Lua.
        -- But, that's simply not true (unless you don't use `vim.cmd` or something similar).
        -- It actually shows syntax highlighting in `vim.cmd`!
        "vim",
        -- Enable highlighting for Vim help files.
        -- EG: :h LSP
        "vimdoc",
        "query",
        "regex",
        "bash",
        -- NOTE: If you don't do Markdown stuff (I bet you do Markdown stuff though), you still don't want to remove this.
        -- Noice.nvim requires this parser so, we have some Markdown-highighting in some other places! 🤯
        "markdown",
        "markdown_inline",
        -- HACK: Since, we override filetypes for NEOGITCOMMITMESSAGE filetypes, so Treesitter might not install these.
        "git_rebase",
        "gitcommit",
        -- NOTE: Diff is needed for LSPsaga.
        "diff",
      },

      -- Auto install parsers once we enter a buffer.
      -- BUG: This is super buggy and WILL show like a billion errors.
      -- More information in the README.
      auto_install = true,

      -- Enable highlighting.
      -- Otherwise, the whole plugin will be disabled.
      highlight = {
        enable = true,
        -- NOTE: If you want to use Vim's regex highlighting (which is really unrecommended,
        -- since, it's resource intensive and, will show wrong highlights),
        -- You can still enable it via un-commenting the following line at L32.
        -- It'll NEVER BE SUPPORTED.

        -- additional_vim_regex_highlighting = true
      },

      -- indent = {
      --   -- Enable Treesitter-based indentation.
      --   -- It'll override the `=` operator and, others.
      --   enable = true,
      -- },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.schedule(function()
        require("nvim-treesitter.configs").setup({
          indent = {
            enable = true,
          },
        })
      end)
    end,
    init = function()
      require("core.utils.lazy")("nvim-treesitter")
    end,
    build = ":TSUpdate",
  },
  {
    "andymass/vim-matchup",
    opts = {
      matchup = {
        enable = true,
        enable_quotes = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.g.matchup_matchparen_offscreen = {}

      vim.cmd("silent! do FileType")
    end,
    dependencies = {
      "nvim-treesitter",
    },
    init = function()
      require("core.utils.lazy")("vim-matchup")
    end,
  },
  {
    "Fymyte/rasi.vim",
    ft = "rasi",
  },
  {
    "folke/twilight.nvim",
    opts = true,
  },
  {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.editor.hydra")
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    opts = true,
    keys = {
      { "<leader>rr", "<cmd>lua require('refactoring').select_refactor()<CR>", mode = "x" },
    },
  },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      {
        "]n",
        function()
          require("notebook-navigator").move_cell("d")
        end,
      },
      {
        "[n",
        function()
          require("notebook-navigator").move_cell("u")
        end,
      },
      { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      "mini.comment",
      "hkupty/iron.nvim",
      "hydra.nvim",
    },
    event = "VeryLazy",
    config = function()
      local nn = require("notebook-navigator")
      nn.setup({ activate_hydra_keys = "<leader>n" })
    end,
  },
  {
    "abecodes/tabout.nvim",
    opts = true,
    event = "InsertEnter",
  },
  {
    "max397574/better-escape.nvim",
    opts = true,
    event = "InsertEnter",
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "ellisonleao/glow.nvim",
    opts = true,
    cmd = {
      "Glow",
    },
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "uga-rosa/ccc.nvim",
    opts = function()
      local RgbHslCmykInput = require("plugins.configs.editor.ccc")
      return {
        highlighter = {
          auto_enable = false,
          lsp = true,
        },
        inputs = {
          RgbHslCmykInput,
        },
      }
    end,
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    keys = {
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick" },
      { "<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert" },
      { "<leader>zh", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Highlighter" },
    },
  },
}
