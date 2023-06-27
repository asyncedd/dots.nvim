-- lua/plugins/specs/editor.lua
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
    "nvim-neorg/neorg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/notes/work",
              home = "~/notes/home",
            },
          },
        },
        ["core.concealer"] = {},
        ["core.autocommands"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.integrations.truezen"] = {},
        ["core.integrations.telescope"] = {},
      },
    },
    config = function(_, opts)
      require("neorg").setup(opts)

      local neorg_callbacks = require("neorg.callbacks")

      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
          },

          i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
    dependencies = {
      "plenary.nvim",
      "nvim-neorg/neorg-telescope",
    },
    ft = "norg",
  },
  {
    "Pocco81/true-zen.nvim",
    opts = {
      integrations = {
        twilight = true,
      },
    },
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZNarrow",
      "TZFocus",
    },
    dependencies = "twilight.nvim",
  },
  {
    "folke/twilight.nvim",
    opts = true,
  },
}
