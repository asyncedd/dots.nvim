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
        signs = dots.UI.icons.Git.Signs,
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
        ensure_installed = dots.editor.treesitter.parsers,
        highlight = {
          enable = true,
        },
        matchup = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
      event = {
        "BufReadPost",
        "BufWinEnter",
        "BufNewFile",
      },
      enabled = dots.editor.treesitter.enabled,
    },
    {
      "folke/flash.nvim",
      opts = {
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
        {
          "M",
          mode = { "n", "o", "x" },
          function()
            require("flash").treesitter()
          end,
        },
        {
          "H",
          mode = { "n", "x", "o" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "s",
          mode = { "n", "x" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "L",
          function()
            local state = require("flash").jump({
              remote_op = { restore = false },
            })

            vim.api.nvim_create_autocmd("TextChanged", {
              once = true,
              buffer = vim.api.nvim_get_current_buf(),
              callback = function()
                state:restore()
              end,
            })
          end,
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
      dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        end,
      },
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
      "mbbill/undotree",
      keys = {
        { "<leader>u", "<cmd>UndotreeToggle<CR>" },
      },
      init = function()
        table.insert(dots.editor.treesitter.parsers, "diff")
      end,
      enabled = dots.editor.undotree.enabled,
    },
    {
      "mg979/vim-visual-multi",
      event = "VeryLazy",
    },
    {
      "chrisgrieser/nvim-origami",
      opts = {
        keepFoldsAcrossSessions = false,
        pauseFoldsOnSearch = true,
        setupFoldKeymaps = true,
      },
      keys = {
        { "h", expr = true },
        { "l", expr = true },
      },
      event = "VeryLazy",
    },
    {
      "echasnovski/mini.clue",
      opts = function()
        local miniclue = require("mini.clue")
        local hints = {}
        -- stylua: ignore
        local keys = { "B", "b", "C", "c", "D", "d", "F", "f", "h", "i", "J", "j", "L", "l", "O", "o", "P", "p", "Q", "q", "T", "t", "U", "u", "W", "w", "X", "x", "y", "%", "" }
        -- stylua: ignore end

        for _, br in ipairs({ "[", "]" }) do
          for _, v in ipairs(keys) do
            table.insert(hints, { mode = "n", keys = br .. (v ~= "" and v or br), postkeys = br })
          end
        end

        return {
          triggers = {
            -- [] triggers
            { mode = "n", keys = "]" },
            { mode = "n", keys = "[" },
            -- Leader triggers
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },

            -- Built-in completion
            { mode = "i", keys = "<C-x>" },

            -- `g` key
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },

            -- Marks
            { mode = "n", keys = "'" },
            { mode = "n", keys = "`" },
            { mode = "x", keys = "'" },
            { mode = "x", keys = "`" },

            -- Registers
            { mode = "n", keys = '"' },
            { mode = "x", keys = '"' },
            { mode = "i", keys = "<C-r>" },
            { mode = "c", keys = "<C-r>" },

            -- Window commands
            { mode = "n", keys = "<C-w>" },

            -- `z` key
            { mode = "n", keys = "z" },
            { mode = "x", keys = "z" },
          },

          clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),

            hints,

            miniclue.gen_clues.windows({
              submode_move = true,
              submode_navigate = true,
              submode_resize = true,
            }),
          },
          window = {
            -- Show window immediately
            delay = 0,
            config = {
              border = "solid",
            },
          },
        }
      end,
      event = "VeryLazy",
    },
  }
