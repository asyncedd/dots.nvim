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
    event = { "VeryLazy", "BufReadPost" },
  },
}
