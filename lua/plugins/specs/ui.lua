return {
  "catppuccin/nvim",
  {
    "folke/noice.nvim",
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
      require("mini.indentscope").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "gen740/SmoothCursor.nvim",
    config = true,
    event = "VeryLazy",
  },
  {
    "rebelot/heirline.nvim",
    opts = function()
      return require("plugins.configs.ui.heirline")
    end,
    config = true,
    event = { "User file", "VeryLazy", "BufReadPost" },
  },
}
