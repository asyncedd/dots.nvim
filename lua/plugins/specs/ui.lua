return {
  "catppuccin/nvim",
  {
    "folke/noice.nvim",
    opts = function()
      return require("plugins.configs.ui.noice")
    end,
    config = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      require("plugins.configs.ui.indent-blankline")
    end,
    config = true,
    event = { "VeryLazy", "User file" },
  },
  {
    "echasnovski/mini.animate",
    opts = function()
      return require("plugins.configs.ui.mini-animate")
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "edluffy/specs.nvim",
    opts = function()
      return require("plugins.configs.ui.specs")
    end,
    config = function(_, opts)
      require("specs").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    opts = function()
      return require("plugins.configs.ui.mini-indentscope")
    end,
    config = function(_, opts)
      require("plugins.highlight.ui.mini-indentscope")

      require("mini.indentscope").setup(opts)
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
  },
  {
    "rebelot/heirline.nvim",
    opts = function()
      return require("plugins.configs.ui.heirline")
    end,
    config = true,
    event = { "User file", "VeryLazy", "BufReadPost" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
   "akinsho/bufferline.nvim",
    opts = function()
      return require("plugins.configs.ui.bufferline")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    event = { "VeryLazy" },
    keys = {
      { "[b", "<cmd>BufferLineCycleNext<CR>" },
      { "]b", "<cmd>BufferLineCyclePrev<CR>" },
      { "gbp", "<cmd>BufferLinePick<CR>" },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      return require("plugins.configs.ui.alpha").config
    end,
    event = "VimEnter",
    config = true,
  },
}
