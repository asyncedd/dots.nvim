return {
  -- Colorscheme.
  "catppuccin/nvim",
  -- Completion.
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
      {
        "L3MON4D3/LuaSnip",
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
        config = true,
        keys = {
          {
            "<tab>",
            function()
              return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true, silent = true, mode = "i",
          },
          { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
          { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
      },
    },
    event = "InsertEnter",
    config = function()
      require("plugins.configs.completion.cmp")
    end,
  },
  -- Editor.
  {
    "numToStr/Comment.nvim",
    config = true,
    event = "VeryLazy",
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
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    },
    config = true,
    event = "BufReadPost",
  },
  -- LSP stuff.
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
      require("plugins.configs.lsp.lspconfig")
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      {
        "j-hui/fidget.nvim",
        opts = {
          text = {
            spinner = "dots"
          }
        },
        config = true,
      },
      {
        "folke/trouble.nvim",
        config = true,
      },
      "folke/neodev.nvim",
    }
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      ui = {
        theme = 'round',
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
      }
    },
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("plugins.configs.editor.motion")
    end,
    dependencies = {
      {
        "ggandor/flit.nvim",
        keys = function()
          local ret = {}
          for _, key in ipairs({ "f", "F", "t", "T" }) do
            ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
          end
          return ret
        end,
        opts = { labeled_modes = "nx" },
      },
      "tpope/vim-repeat",
      "echasnovski/mini.ai",
    },
    event = "VeryLazy",
  },
  -- Tools
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" }
    }
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.configs.editor.treesitter")
    end,
    dependencies = {
      "andymass/vim-matchup",
    },
    event = "BufReadPost",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      show_end_of_line = true,
      space_char_blankline = " ",
      enabled = true,
      colored_indent_levels = false,
      show_trailing_blankline_indent = true,
    },
    event = "BufReadPost",
    config = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = true,
  },
  {
    "rebelot/heirline.nvim",
    event = "BufReadPost",
    config = function()
      require("plugins.configs.ui.heirline")
    end
  },
  -- {
  --   "monkoose/matchparen.nvim",
  --   event = "BufReadPost",
  --   config = true,
  -- }
}
