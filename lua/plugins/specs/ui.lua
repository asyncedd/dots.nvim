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
}
