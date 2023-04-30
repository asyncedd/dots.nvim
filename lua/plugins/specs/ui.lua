return {
  "catppuccin/nvim",
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return require("plugins.configs.ui.bufferline")
    end,
    config = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    opts = function()
      return require("plugins.configs.ui.noice")
    end,
    event = "VeryLazy",
    config = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
