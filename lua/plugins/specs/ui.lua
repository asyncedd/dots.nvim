return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = function()
      return require("plugins.configs.ui.catppuccin")
    end,
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return require("plugins.configs.ui.bufferline")
    end,
    config = true,
    dependencies = {
      "nvim-web-devicons",
      {
        "echasnovski/mini.bufremove",
        config = function()
          require("mini.bufremove").setup()
        end,
      },
    },
    event = "VeryLazy",
    keys = {
      { "gbb", "<cmd>BufferLinePick<CR>", desc = "Toggle Buffer picker" },
      { "gbp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Buffer pin" },
      { "gbd", "<cmd>lua require('mini.bufremove').delete(0, false)<CR>", desc = "Delete current buffer" },
      { "gbc", "<cmd>BufferLinePickClose<CR>", desc = "Toggle buffer picker closer" },
      { "[b", "<cmd>BufferLineCycleNext<CR>", desc = "Cycle to the next buffer" },
      { "]b", "<cmd>BufferLineCyclePrev<CR>", desc = "Cycle to the prev buffer" },
    },
  },
  {
    "folke/noice.nvim",
    opts = function()
      return require("plugins.configs.ui.noice")
    end,
    event = "VeryLazy",
    config = true,
    dependencies = {
      "nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    opts = function()
      return require("plugins.configs.ui.indentscope")
    end,
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
  {
    "echasnovski/mini.animate",
    opts = function()
      return require("plugins.configs.ui.animate")
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "rebelot/heirline.nvim",
    opts = function()
      return require("plugins.configs.ui.heirline")
    end,
    config = true,
    event = { "VeryLazy", "BufReadPost" },
    dependencies = {
      {
        "jcdickinson/wpm.nvim",
        config = true,
      },
      "nvim-web-devicons",
    },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = true,
    event = "VeryLazy",
  },
  {
    "utilyre/barbecue.nvim",
    opts = function()
      return require("plugins.configs.ui.barbecue")
    end,
    config = function(_, opts)
      require("barbecue").setup(opts)
    end,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    event = {
      "LSPAttach",
      "VeryLazy",
    },
    init = function()
      require("core.utils.lazy_load")("barbecue.nvim")
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      return require("plugins.configs.ui.alpha")
    end,
    config = true,
    init = function()
      if vim.fn.expand("%") == "" then
        require("lazy").load({ plugins = "alpha-nvim" })
      end
    end,
  },
  {
    "karb94/neoscroll.nvim",
    opts = function()
      return require("plugins.configs.ui.neoscroll")
    end,
    event = "VeryLazy",
  },
  {
    "folke/drop.nvim",
    opts = function()
      return require("plugins.configs.ui.drop")
    end,
    config = true,
    event = { "CursorHold", "CursorHoldI", "VeryLazy" },
  },
  {
    -- TODO: Add Todo-comments.nvim
    "folke/todo-comments.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "NvChad/nvim-colorizer.lua",
    init = function()
      require("core.utils.lazy_load")("nvim-colorizer.lua")
    end,
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "folke/zen-mode.nvim",
    dependencies = {
      { "folke/twilight.nvim", opts = true },
    },
    opts = true,
    cmd = {
      "ZenMode",
    },
    keys = {
      { "<leader>az", "<cmd>ZenMode<CR>", desc = "Toggle ZenMode" },
    },
  },
  {
    "b0o/incline.nvim",
    opts = function()
      return require("plugins.configs.ui.incline")
    end,
    event = "VeryLazy",
  },
  {
    "edluffy/specs.nvim",
    opts = function()
      return require("plugins.configs.ui.specs")
    end,
    event = "VeryLazy",
  },
  {
    "mvllow/modes.nvim",
    opts = function()
      return require("plugins.configs.ui.modes")
    end,
    event = "VeryLazy",
  },
  {
    "nacro90/numb.nvim",
    opts = true,
    event = "CmdlineEnter",
  },
  {
    "gen740/SmoothCursor.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "tamton-aquib/flirt.nvim",
    opts = true,
    event = "VeryLazy",
  },
  {
    "tamton-aquib/keys.nvim",
    opts = { enable_on_startup = true },
    event = "VeryLazy",
    config = function(_, opts)
      require("keys").setup(opts)

      vim.cmd("KeysToggle")
    end,
  },
  {
    "tamton-aquib/mpv.nvim",
    opts = true,
    cmd = {
      "MpvToggle",
    },
  },
}
