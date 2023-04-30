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
}
