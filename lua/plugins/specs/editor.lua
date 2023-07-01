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
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
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
    "LudoPinelli/comment-box.nvim",
    opts = true,
    keys = {
      { "<leader>gcc", "<cmd>CBccbox<CR>", desc = "Center aligned comment box", mode = { "x", "n" } },
      { "<leader>gca", "<cmd>CBacbox<CR>", desc = "Center adapted comment box", mode = { "x", "n" } },
      { "<leader>gch", "<cmd>CBllbox<CR>", desc = "Left aligned comment box", mode = { "x", "n" } },
      { "<leader>gcl", "<cmd>CBrrbox<CR>", desc = "Right aligned comment box", mode = { "x", "n" } },
      {
        "<leader>gco",
        "<cmd>lua require('comment-box').catalog()<CR>",
        desc = "Open comment box catolog",
        mode = { "x", "n" },
      },
      { "<leader>gcp", ":CBcbox ", desc = "Pick comment box" },
    },
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
        "lua",
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
        -- Enable Lua patterns highlighting.
        "luap",
        -- Enable Lua docs.
        "luadoc",
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
    opts = function()
      local gitsigns = require("gitsigns")
      local git_hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full 
 ^ ^              _S_: stage buffer      _v_: diff view      _/_: show base file
 ^
 ^ ^                             _<Enter>_: Lazygit
 ^
 ^ ^                        _q_: exit _;_: exit _<Esc>_: exit
]]

      local windows_hint = [[
      ^       _h_: Right window     _l_: Left window     _k_: The window above     _j_ The window below
      ^
      _H_:   Increase right width     _L_: Increase left width     _K_: Increase height     _J_: Decrease height   
      ^
      ^ ^                                   _e_: Equalize window sizes
      ^
      ^                       _Q_: Close current window _<C-q>_: Close current window
      ^
      ^                                 _s_: Split below       _v_: Split vertically
      ^
      ^ ^                               _q_: exit     _;_: exit     _<Esc>_: exit
      ]]

      local lspsaga_hint = [[
      ^                         DIAGNOSTICS
      ^ ^     _l_: Line    _b_: Buffer    _w_: Workspace    _s_: Cursor              
      ^                            CALLS
      ^            _i_: ingoing              _o_: outgoing
      ^
      ^ ^                 _q_: exit _;_: exit _<Esc>_: exit
      ]]

      return {
        {
          name = "Git",
          hint = git_hint,
          config = {
            buffer = true,
            color = "pink",
            invoke_on_body = true,
            hint = {
              border = "rounded",
            },
            on_enter = function()
              vim.cmd("mkview")
              vim.cmd("silent! %foldopen!")
              vim.bo.modifiable = false
              gitsigns.toggle_signs(true)
              gitsigns.toggle_linehl(true)
            end,
            on_exit = function()
              local cursor_pos = vim.api.nvim_win_get_cursor(0)
              vim.cmd("loadview")
              vim.api.nvim_win_set_cursor(0, cursor_pos)
              vim.cmd("normal zv")
              gitsigns.toggle_linehl(false)
              gitsigns.toggle_deleted(false)
            end,
          },
          mode = { "n", "x" },
          body = "<leader>g",
          heads = {
            {
              "J",
              function()
                if vim.wo.diff then
                  return "]c"
                end
                vim.schedule(function()
                  gitsigns.next_hunk()
                end)
                return "<Ignore>"
              end,
              { expr = true, desc = "next hunk" },
            },
            {
              "K",
              function()
                if vim.wo.diff then
                  return "[c"
                end
                vim.schedule(function()
                  gitsigns.prev_hunk()
                end)
                return "<Ignore>"
              end,
              { expr = true, desc = "prev hunk" },
            },
            { "s", "<cmd>Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
            { "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
            { "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
            { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
            { "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
            { "b", gitsigns.blame_line, { desc = "blame" } },
            {
              "B",
              function()
                gitsigns.blame_line({ full = true })
              end,
              { desc = "blame show full" },
            },
            { "/", gitsigns.show, { exit = true, desc = "show base file" } }, -- show the base of the file
            { "v", "<cmd>DiffviewOpen<CR>", { exit = true, desc = "Diff view" } },
            {
              "<Enter>",
              "<Cmd>lua require('core.utils.lazyvim').float_term('lazygit', { ctrl_hjkl = false, esc_esc = true })<CR>",
              { exit = true, desc = "Lazygit" },
            },
            { "q", nil, { exit = true, nowait = true, desc = "exit" } },
            { ";", nil, { exit = true, nowait = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },
          },
        },
        {
          name = "Change / Resize Window",
          mode = { "n" },
          body = "<C-w>",
          hint = windows_hint,
          config = {
            hint = {
              border = "rounded",
            },
            color = "amaranth",
            invoke_on_body = true,
          },
          heads = {
            -- move between windows
            { "h", "<C-w>h" },
            { "j", "<C-w>j" },
            { "k", "<C-w>k" },
            { "l", "<C-w>l" },

            -- resizing window
            { "H", "<C-w>3<" },
            { "L", "<C-w>3>" },
            { "K", "<C-w>2-" },
            { "J", "<C-w>2+" },

            -- equalize window sizes
            { "e", "<C-w>=" },

            -- close active window
            { "Q", "<cmd>q<cr>" },
            { "<C-q>", "<cmd>q<cr>" },

            -- split
            { "s", "<cmd>split<CR>" },
            { "v", "<cmd>vsplit<CR>" },

            -- exit this Hydra
            { "q", nil, { exit = true, nowait = true } },
            { ";", nil, { exit = true, nowait = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },
          },
        },
        {
          name = "lspsaga",
          mode = { "n" },
          hint = lspsaga_hint,
          config = {
            hint = {
              border = "rounded",
            },
            color = "pink",
            invoke_on_body = true,
          },
          body = "<leader>s",
          heads = {
            { "l", "<cmd>Lspsaga show_line_diagnostics<CR>" },
            { "b", "<cmd>Lspsaga show_buffer_diagnostics<CR>" },
            { "w", "<cmd>Lspsaga show_workspace_diagnostics<CR>" },
            { "s", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
            { "i", "<cmd>Lspsaga ingoing_calls<CR>" },
            { "o", "<cmd>Lspsaga outgoing_calls<CR>" },
            { "q", nil, { exit = true, nowait = true } },
            { ";", nil, { exit = true, nowait = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },
          },
        },
      }
    end,
    event = "VeryLazy",
    config = function(_, opts)
      require("plugins.configs.editor.hydra")(opts)
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
    "jubnzv/mdeval.nvim",
    opts = true,
    cmd = {
      "MdEval",
    },
  },
}
