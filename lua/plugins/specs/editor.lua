return not dots.editor.enabled and {}
  or {
    {
      "chrisgrieser/nvim-spider",
      opts = {
        skipInsignificantPunctuation = false,
      },
      enabled = dots.editor.spider.enabled,
      event = "VeryLazy",
      keys = {
        { mode = { "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" } },
        { mode = { "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" } },
        { mode = { "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" } },
        { mode = { "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" } },
        {
          mode = { "n", "o", "x" },
          "W",
          "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-W" },
        },
        {
          mode = { "n", "o", "x" },
          "E",
          "<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-E" },
        },
        {
          mode = { "n", "o", "x" },
          "B",
          "<cmd>lua require('spider').motion('b', { skipInsignificantPunctuation = true } )<CR>",
          { desc = "Spider-B" },
        },
        {
          mode = { "n", "o", "x" },
          "gB",
          "<cmd>lua require('spider').motion('ge', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-W" },
        },
      },
    },
    {
      "chrisgrieser/nvim-various-textobjs",
      opts = {},
      event = "VeryLazy",
      enabled = dots.editor.textobjs.enabled,
      keys = {
        {
          mode = { "x", "o" },
          "iw",
          "<cmd>lua require('various-textobjs').subword(true)<cr>",
          { desc = "inner subword" },
        },
        {
          mode = { "x", "o" },
          "aw",
          "<cmd>lua require('various-textobjs').subword(false)<cr>",
          { desc = "outer subword" },
        },
        {
          mode = { "x", "o" },
          "iW",
          "<cmd>lua require('various-textobjs').subword(true)<cr>",
          { desc = "inner subword" },
        },
        {
          mode = { "x", "o" },
          "aW",
          "<cmd>lua require('various-textobjs').subword(false)<cr>",
          { desc = "outer subword" },
        },
        {
          "gG",
          "<cmd>lua require('various-textobjs').entireBuffer()<CR>",
          mode = { "x", "o" },
        },
      },
    },
    {
      "kylechui/nvim-surround",
      opts = true,
      event = "VeryLazy",
      enabled = dots.editor.surround.enabled,
    },
    {
      "lewis6991/gitsigns.nvim",
      enabled = dots.editor.gitsigns.enabled,
      event = "VeryLazy",
      opts = {
        signs = {
          add = { text = dots.UI.icons.Git.Signs.add },
          change = { text = dots.UI.icons.Git.Signs.change },
          delete = { text = dots.UI.icons.Git.Signs.delete },
          topdelete = { text = dots.UI.icons.Git.Signs.topdelete },
          changedelete = { text = dots.UI.icons.Git.Signs.changedelete },
          untracked = { text = dots.UI.icons.Git.Signs.untracked },
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
      "nvim-treesitter/nvim-treesitter",
      opts = {
        auto_install = true,
        ensure_installed = {},
        highlight = {
          enable = true,
        },
        matchup = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
      event = {
        "BufRead",
        "BufWinEnter",
        "BufNewFile",
      },
      enabled = dots.editor.treesitter.enabled,
      dependencies = {
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
          init = function()
            require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          end,
        },
      },
    },
    {
      "folke/flash.nvim",
      opts = {
        label = {
          rainbow = {
            enabled = true,
            shade = 3,
          },
        },
        modes = {
          char = {
            search = {
              wrap = true,
            },
            config = function(opts)
              opts.autohide = vim.fn.mode(true):find("o")
              opts.jump_labels = true
            end,
          },
        },
      },
      enabled = dots.editor.flash.enabled,
      keys = {
        {
          "r",
          mode = "o",
          function()
            require("flash").remote()
          end,
          desc = "Remote Flash",
        },
        { "f", mode = { "x", "n", "o" } },
        { "F", mode = { "x", "n", "o" } },
        { "t", mode = { "x", "n", "o" } },
        { "T", mode = { "x", "n", "o" } },
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
      event = "VeryLazy",
    },
    {
      "RRethy/vim-illuminate",
      opts = {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      },
      config = function(_, opts)
        require("illuminate").configure(opts)

        local function map(key, dir, buffer)
          vim.keymap.set("n", key, function()
            require("illuminate")["goto_" .. dir .. "_reference"](false)
          end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
        end

        map("]]", "next")
        map("[[", "prev")

        -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
        vim.api.nvim_create_autocmd("FileType", {
          callback = function()
            local buffer = vim.api.nvim_get_current_buf()
            map("]]", "next", buffer)
            map("[[", "prev", buffer)
          end,
        })
      end,
      event = "VeryLazy",
    },
    {
      "echasnovski/mini.files",
      opts = true,
      init = function()
        if vim.fn.argc() == 1 then
          local stat = vim.loop.fs_stat(vim.fn.argv(0))
          if stat and stat.type == "directory" then
            require("mini.files")
          end
        end
      end,
      keys = {
        {
          "<leader>to",
          function()
            require("mini.files").open()
          end,
        },
      },
    },
    {
      "nvim-pack/nvim-spectre",
      opts = true,
      keys = {
        { "<leader>s", "<cmd>lua require('spectre').open()<CR>", desc = "Open Spectr" },
        {
          "<leader>sw",
          "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>",
          desc = "Search current word",
        },
        { "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", mode = "x", desc = "Search current word" },
        {
          "<leader>sp",
          "<cmd>lua require('spectre').open_file_search({ select_word=true })CR>",
          mode = "n",
          desc = "Search on current word",
        },
      },
    },
    {
      "andymass/vim-matchup",
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = function()
        vim.g.matchup_matchparen_offscreen = {} -- empty = disables
        vim.cmd("silent! do FileType")
      end,
      event = "VeryLazy",
    },
    {
      "echasnovski/mini.bracketed",
      opts = {
        yank = { suffix = "" },
        indent = { suffix = "" },
      },
      event = "VeryLazy",
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
      "monaqa/dial.nvim",
      opts = function()
        local augend = require("dial.augend")
        return {
          default = {
            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.date.alias["%Y/%m/%d"],
          },
          lua = {
            augend.integer.alias.decimal,
            augend.constant.new({
              elements = { "and", "or" },
              word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
              cyclic = true, -- "or" is incremented into "and".
            }),
          },
        }
      end,
      config = function(_, opts)
        local function exists_ft()
          local ft = vim.bo.filetype
          return opts[ft] and ft or "default"
        end

        local function register_dial_group()
          local ret = {}

          for key, value in pairs(opts) do
            ret[key] = key ~= "default" and { unpack(opts.default) } or {}
            for _, name in ipairs(value) do
              table.insert(ret[key], name)
            end
          end

          require("dial.config").augends:register_group(ret)
        end

        local function create_keymaps()
          local map = vim.api.nvim_buf_set_keymap
          local dial_map = require("dial.map")

          local function set_keymap(mode, lhs, rhs)
            map(0, mode, lhs, dial_map[rhs](exists_ft()), { noremap = true })
          end

          set_keymap("n", "<C-a>", "inc_normal")
          set_keymap("n", "<C-x>", "dec_normal")
          set_keymap("n", "g<C-a>", "inc_gnormal")
          set_keymap("n", "g<C-x>", "dec_gnormal")
          set_keymap("v", "<C-a>", "inc_visual")
          set_keymap("v", "<C-x>", "dec_visual")
          set_keymap("v", "g<C-a>", "inc_gvisual")
          set_keymap("v", "g<C-x>", "dec_gvisual")
        end

        register_dial_group()
        create_keymaps()

        vim.api.nvim_create_autocmd("FileType", {
          callback = create_keymaps,
        })
      end,
      event = "VeryLazy",
    },
  }
