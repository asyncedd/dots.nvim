return {
  "catppuccin/nvim",
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
      { "gbp", "<cmd>BufferLinePick<CR>" },
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
    event = { "VeryLazy", "BufRead" },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
      require("plugins.highlight.ui.illuminate")
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = true,
    event = "VeryLazy",
  },
}
