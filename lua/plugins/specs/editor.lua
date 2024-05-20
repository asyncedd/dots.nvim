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
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    build = ":TSUpdate",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")

      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
      vim.schedule(function()
        require("lazy").load({ plugins = { "nvim-treesitter-textobjects" } })
      end)
    end,
    event = "LazyFile",
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
    "echasnovski/mini.diff",
    event = "LazyFile",
    opts = {
      view = {
        style = "sign",
        signs = dots.UI.icons.Gitsigns,
      },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("mini.diff").setup(opts)
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    opts = true,
    keys = { "gS" },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        replace = "gzr",
        update_n_lines = "gzn",

        suffix_last = "l",
        suffix_next = "n",
      },
      search_method = "cover_or_next",
    },
    keys = {
      { "gz", mode = { "x", "o", "n" } },
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

      local gen_ai_spec = require("mini.extra").gen_ai_spec
      return {
        n_lines = 500,
        custom_textobjects = {
          F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          -- i = gen_ai_spec.indent(),
        },
      }
    end,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
          { "echasnovski/mini.extra", opts = true },
        },
      },
    },
    keys = {
      { "i", mode = { "x", "o" } },
      { "a", mode = { "x", "o" } },
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    keys = {
      {
        "gG",
        function()
          require("various-textobjs").entireBuffer()
        end,
        mode = { "x", "o" },
      },
      {
        "ii",
        function()
          if vim.fn.indent(".") == 0 then
            require("various-textobjs").entireBuffer()
          else
            require("various-textobjs").indentation("inner", "inner")
          end
        end,
        mode = { "x", "o" },
        desc = "in an indent block",
      },
      {
        "ai",
        function()
          require("various-textobjs").indentation("outer", "inner")
        end,
        mode = { "x", "o" },
        desc = "around an indent block",
      },
      {
        "iI",
        function()
          require("various-textobjs").indentation("inner", "inner")
        end,
        mode = { "x", "o" },
        desc = "in an indent block",
      },
      {
        "aI",
        function()
          require("various-textobjs").indentation("outer", "outer")
        end,
        mode = { "x", "o" },
        desc = "around an indent block",
      },
      {
        "n",
        function()
          require("various-textobjs").nearEoL()
        end,
        mode = { "x", "o" },
        desc = "to the eol, excluding the last char",
      },
      {
        "gn",
        function()
          require("various-textobjs").diagnostic()
        end,
        mode = { "x", "o" },
        desc = "next diagnostics",
      },
      { -- delete surrounding indentation
        "dsi",
        function()
          -- select outer indentation
          require("various-textobjs").indentation("outer", "outer")

          -- plugin only switches to visual mode when a textobj has been found
          local indentationFound = vim.fn.mode():find("V")
          if not indentationFound then
            return
          end

          -- dedent indentation
          vim.cmd.normal({ "<", bang = true })

          -- delete surrounding lines
          local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1]
          local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1]
          vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
          vim.cmd(tostring(startBorderLn) .. " delete")
        end,
        desc = "delete surrounding indent",
      },
      { -- yank surrounding inner indentation
        "ysii", -- `ysi` would conflict with `ysib` and other textobs
        function()
          local startPos = vim.api.nvim_win_get_cursor(0)

          -- identify start- and end-border
          require("various-textobjs").indentation("outer", "outer")
          local indentationFound = vim.fn.mode():find("V")
          if not indentationFound then
            return
          end
          vim.cmd.normal({ "V", bang = true }) -- leave visual mode so the `'<` `'>` marks are set

          -- copy them into the + register
          local startLn = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
          local endLn = vim.api.nvim_buf_get_mark(0, ">")[1] - 1
          local startLine = vim.api.nvim_buf_get_lines(0, startLn, startLn + 1, false)[1]
          local endLine = vim.api.nvim_buf_get_lines(0, endLn, endLn + 1, false)[1]
          vim.fn.setreg("+", startLine .. "\n" .. endLine .. "\n")

          -- highlight yanked text
          local ns = vim.api.nvim_create_namespace("ysi")
          vim.highlight.range(0, ns, "IncSearch", { startLn, 0 }, { startLn, -1 })
          vim.highlight.range(0, ns, "IncSearch", { endLn, 0 }, { endLn, -1 })
          vim.defer_fn(function()
            vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
          end, 1000)

          -- restore cursor position
          vim.api.nvim_win_set_cursor(0, startPos)
        end,
        desc = "pank surrounding indent",
      },
      {
        "rp",
        "<cmd>lua require('various-textobjs').restOfParagraph()<CR>",
        mode = { "o", "x" },
        desc = "rest of paragraph",
      },
      {
        "ri",
        "<cmd>lua require('various-textobjs').restOfIndentation()<CR>",
        mode = { "o", "x" },
        desc = "rest of indentation",
      },
      { "rg", "G", mode = { "o", "x" }, desc = "rest of buffer" },
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
    "echasnovski/mini.move",
    opts = true,
    keys = {
      {
        "<M-h>",
        mode = { "n", "x" },
      },
      {
        "<M-j>",
        mode = { "n", "x" },
      },
      {
        "<M-k>",
        mode = { "n", "x" },
      },
      {
        "<M-l>",
        mode = { "n", "x" },
      },
    },
  },
}
