-- lua/plugins/specs/motion.lua
--
--  ┌
--  │  Easy motions but, powerful motions. (and textobjects)
--  └

return {
  {
    "folke/flash.nvim",
    opts = {
      highlight = {
        label = {
          rainbow = {
            enabled = true,
            shade = 3,
          },
        },
      },
      continue = true,
      jump = {
        autojump = true,
      },
      char = {
        search = {
          wrap = true,
        },
      },
      remote_op = {
        restore = true,
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
      { "f", mode = { "n", "o", "x" } },
      { "F", mode = { "n", "o", "x" } },
      { "t", mode = { "n", "o", "x" } },
      { "T", mode = { "n", "o", "x" } },
      { "/", mode = { "n", "o", "x" } },
      { "?", mode = { "n", "o", "x" } },
      {
        "r",
        function()
          require("flash").remote()
        end,
        mode = "o",
      },
      {
        "R",
        function()
          require("flash").treesitter_search()
        end,
        mode = { "n", "x", "o" },
      },
      {
        "<CR>",
        function()
          require("flash").jump({ continue = true })
        end,
        mode = { "n", "x", "o" },
      },
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
          c = ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),
          s = ai.gen_spec.treesitter({ a = "@scope", i = "@scope.inner" }, {}),
          [","] = ai.gen_spec.argument(),
        },
        search_method = "cover_or_next",
      }
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter-textobjects",
    },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "w" },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "e" },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "b" },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "ge" },
      { "W", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "w" },
      { "E", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "e" },
      { "B", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "b" },
      { "gE", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "ge" },
    },
  },
  {
    "cbochs/portal.nvim",
    opts = {
      window_options = {
        height = 6,
      },
    },
    keys = {
      { "<C-i>", "<cmd>Portal jumplist forward<CR>", desc = "Toggle portal foward" },
      { "<C-o>", "<cmd>Portal jumplist backward<CR>", desc = "Toggle portal backwards" },
      { "<leader>hj", "<cmd>lua require('portal.builtin').harpoon.tunnel()<CR>", desc = "Toggle portal for harpoon" },
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
        desc = "Kill current line",
      },
      {
        "<C-u>",
        function()
          require("readline").backward_kill_line()
        end,
        mode = "!",
        desc = "Kill line backwards",
      },
      {
        "<M-d>",
        function()
          require("readline").kill_word()
        end,
        mode = "!",
        desc = "Kill word",
      },
      {
        "<M-BS>",
        function()
          require("readline").backward_kill_word()
        end,
        mode = "!",
        desc = "Kill word backwards",
      },
      {
        "<C-w>",
        function()
          require("readline").unix_word_rubout()
        end,
        mode = "!",
        desc = "Unix word rubout",
      },
      {
        "<C-a>",
        function()
          require("readline").beginning_of_line()
        end,
        mode = "!",
        desc = "Go to beginning of line",
      },
      {
        "<C-e>",
        function()
          require("readline").end_of_line()
        end,
        mode = "!",
        desc = "Go to end of line",
      },
      {
        "<M-f>",
        function()
          require("readline").forward_word()
        end,
        mode = "!",
        desc = "Go foward a word.",
      },
      {
        "<M-b>",
        function()
          require("readline").backward_word()
        end,
        mode = "!",
        desc = "Go backwards a word",
      },
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    keys = {
      {
        "aw",
        "<cmd>lua require('various-textobjs').subword(false)<CR>",
        mode = { "o", "x" },
      },
      {
        "iw",
        "<cmd>lua require('various-textobjs').subword(true)<CR>",
        mode = { "o", "x" },
      },
      {
        "gG",
        "<cmd>lua require('various-textobjs').entireBuffer()<CR>",
        mode = { "o", "x" },
        desc = "Select entire buffer",
      },
      {
        "gW",
        "<cmd>lua require('various-textobjs').visibleInWindow()<CR>",
        mode = { "o", "x" },
        desc = "Select the current visible area",
      },
      {
        "i_",
        "<cmd>lua require('various-textobjs').lineCharacterwise(true)<CR>",
        mode = { "o", "x" },
        desc = "Select inner line Characterwise",
      },
      {
        "a_",
        "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>",
        mode = { "o", "x" },
        desc = "Select around line Characterwise",
      },
    },
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    opts = {
      textsubjects = {
        enable = true,
        prev_selection = ",", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["."] = "textsubjects-smart",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
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
    "smjonas/duplicate.nvim",
    opts = true,
    keys = {
      "yd",
      "ydd",
    },
  },
  {
    "ThePrimeagen/harpoon",
    opts = {
      global_settings = {
        tabline = false,
      },
    },
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
      { "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
      {
        "<leader>h",
        function()
          require("harpoon.ui").nav_file(vim.v.count or 1)
        end,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function(_, opts)
      local function flash(prompt_bufnr)
        require("flash").jump({
          pattern = "^",
          highlight = { label = { after = { 0, 0 } } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        })
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          n = { s = flash },
          i = { ["<c-s>"] = flash },
        },
      })
    end,
  },
}
