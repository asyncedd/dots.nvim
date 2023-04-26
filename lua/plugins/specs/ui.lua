return {
  {
    "rebelot/heirline.nvim",
    config = function()
      require("plugins.configs.ui.heirline")
    end,
    event = { "VeryLazy", "BufReadPost" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
