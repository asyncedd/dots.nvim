-- lua/plugins/specs/ui.lua
--
--  ┌
--  │               Plugins that improve the UI
--  └

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
    event = "VeryLazy",
    init = function()
      require("core.utils.lazy_load")("heirline.nvim")
    end,
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
    config = function(_, opts)
      require("alpha").setup(opts)
    end,
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
    keys = {
      { "<C-u>", modes = { "n", "x", "o" } },
      { "<C-d>", modes = { "n", "x", "o" } },
      { "<C-b>", modes = { "n", "x", "o" } },
      { "<C-f>", modes = { "n", "x", "o" } },
      { "<C-y>", modes = { "n", "x", "o" } },
      { "<C-e>", modes = { "n", "x", "o" } },
      { "zt", modes = { "n", "x", "o" } },
      { "zz", modes = { "n", "x", "o" } },
      { "zb", modes = { "n", "x", "o" } },
    },
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
    "echasnovski/mini.hipatterns",
    opts = function()
      return require("plugins.configs.ui.hipatterns")
    end,
    config = function(_, opts)
      require("mini.hipatterns").setup(opts)
    end,
    event = "VeryLazy",
  },
}
