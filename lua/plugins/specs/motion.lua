return {
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
    "ggandor/leap.nvim",
    config = function()
      require("plugins.configs.motion.leap")
    end,
    keys = {
      { "s", "<Plug>(leap-forward-to)", mode = { "n", "x", "o" }, desc = "Leap foward to" },
      { "S", "<Plug>(leap-backward-to)", mode = { "n", "o" }, desc = "Leap backward to", noremap = true },
      { "x", "<Plug>(leap-forward-till)", mode = { "x", "o" }, desc = "Leap foward till" },
      { "X", "<Plug>(leap-backward-till)", mode = { "x", "o" }, desc = "Leap backward till" },
      { "gs", "<Plug>(leap-from-window)", mode = { "x", "o" }, desc = "Leap from window" },
      { "gS", "<Plug>(leap-cross-window)", mode = { "x", "o" }, desc = "Leap backward to" },
      {
        "gz",
        function()
          -- https://www.reddit.com/r/neovim/comments/13l0p0p/leapnvim_meets_vimilluminate/
          local ref = require("illuminate.reference").buf_get_references(vim.api.nvim_get_current_buf())
          if not ref or #ref == 0 then
            return false
          end

          local targets = {}
          for _, v in pairs(ref) do
            table.insert(targets, {
              pos = { v[1][1] + 1, v[1][2] + 1 },
            })
          end

          require("leap").leap({ targets = targets, target_windows = { vim.api.nvim_get_current_win() } })

          return true
        end,
        mode = { "n", "x", "o" },
        desc = "Leap to matching words",
      },
      -- https://github.com/GCBallesteros/nixfiles/blob/9dc4af5c954bb3800c78c4588d298da3a38cf6ba/neovim/lua/plugins/configs/leap.lua#L4
      {
        "<leader>k",
        function()
          local get_line_starts = require("plugins.configs.motion.leap.get_line_starts")
          local winid = vim.api.nvim_get_current_win()
          require("leap").leap({
            target_windows = { winid },
            targets = get_line_starts(winid, "down"),
          })
        end,
        mode = { "n", "x", "o" },
        desc = "Leap up line-wise",
      },
      {
        "<leader>j",
        function()
          local get_line_starts = require("plugins.configs.motion.leap.get_line_starts")
          local winid = vim.api.nvim_get_current_win()
          require("leap").leap({
            target_windows = { winid },
            targets = get_line_starts(winid, "up"),
          })
        end,
        mode = { "n", "x", "o" },
        desc = "Leap down line-wise",
      },
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
      { "f", mode = { "n", "x", "o" }, desc = "Move to next char" },
      { "F", mode = { "n", "x", "o" }, desc = "Move to prev char" },
      { "t", mode = { "n", "x", "o" }, desc = "Move before next char" },
      { "T", mode = { "n", "x", "o" }, desc = "Move before prev char" },
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
    dependencies = {
      "nvim-treesitter-textobjects",
    },
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
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "w" },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" }, desc = "e" },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "b" },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" }, desc = "ge" },
    },
  },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = {
      "leap.nvim",
    },
    opts = true,
    event = "VeryLazy",
  },
  {
    "cbochs/portal.nvim",
    opts = true,
    keys = {
      { "<C-i>", "<cmd>Portal jumplist forward<CR>", desc = "Toggle portal foward" },
      { "<C-o>", "<cmd>Portal jumplist backward<CR>", desc = "Toggle portal backwards" },
      { "<leader>hj", "<cmd>lua require('portal.builtin').harpoon.tunnel()<CR>", desc = "Toggle portal for harpoon" },
    },
    dependencies = {
      "portal.nvim",
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
      { "<C-d>", "<Delete>", mode = "!", desc = "Delete" },
      { "<C-h>", "<BS>", mode = "!", desc = "Backspace" },
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
      { "<C-f>", "<Right>", mode = "!", desc = "Go right" },
      { "<C-b>", "<Left>", mode = "!", desc = "Go left" },
      { "<C-n>", "<Down>", mode = "!", desc = "Go down" },
      { "<C-p>", "<Up>", mode = "!", desc = "Go up" },
    },
  },
  {
    "abecodes/tabout.nvim",
    opts = true,
    event = "InsertEnter",
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    keys = {
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
    "ThePrimeagen/harpoon",
    opts = function()
      return require("plugins.configs.motion.harpoon")
    end,
    config = function(_, opts)
      require("harpoon").setup(opts)

      require("telescope").load_extension("harpoon")
    end,
    dependencies = {
      "plenary.nvim",
      "telescope.nvim",
    },
    keys = {
      {
        "<leader>hh",
        "<cmd>require('harpoon.mark').add_file()<CR>",
        desc = "Add file",
      },
      {
        "<leader>hm",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
        desc = "Toggle quick menu",
      },
      {
        "[h",
        "<cmd>lua require('harpoon.ui').nav_next()<CR>",
        desc = "Go to the next harpoon",
      },
      {
        "]h",
        "<cmd>lua require('harpoon.ui').nav_prev()<CR>",
        desc = "Go to the prev harpoon",
      },
      {
        "<leader>fh",
        "<cmd>Telescope harpoon marks<CR>",
        desc = "Open Telescope for seletcting harpoons",
      },
    },
  },
  {
    "ggandor/leap-ast.nvim",
    dependencies = {
      "leap.nvim",
    },
    keys = {
      { "<leader>ss", "<cmd>lua require('leap-ast').leap()<CR>", mode = { "x", "n", "o" } },
    },
  },
  {
    "LeonHeidelbach/trailblazer.nvim",
    opts = function()
      return require("plugins.configs.motion.trailblazer")
    end,
    config = function(_, opts)
      require("trailblazer").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
}
